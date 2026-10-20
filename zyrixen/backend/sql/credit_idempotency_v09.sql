-- Zyrixen v0.9: one durable request ID per completed job, including no-op jobs.
ALTER TABLE public.zyrixen_jobs ADD COLUMN IF NOT EXISTS request_id uuid;
ALTER TABLE public.zyrixen_jobs ADD COLUMN IF NOT EXISTS source_digest text;
CREATE UNIQUE INDEX IF NOT EXISTS zyrixen_jobs_request_id_unique
  ON public.zyrixen_jobs(request_id);

CREATE OR REPLACE FUNCTION public.zyrixen_complete_job(
  p_user_id uuid, p_request_id uuid, p_source_chars integer,
  p_transformations integer, p_source_digest text
) RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
SET search_path TO 'public', 'pg_temp'
AS $fn$
DECLARE
  v_user public.zyrixen_users%ROWTYPE;
  v_existing public.zyrixen_jobs%ROWTYPE;
  v_enabled boolean;
  v_maintenance boolean;
  v_charge integer;
BEGIN
  IF p_source_chars < 1 OR p_source_chars > 5000000 OR p_transformations < 0
     OR p_request_id IS NULL OR p_source_digest IS NULL
     OR p_source_digest !~ '^[a-f0-9]{64}$' THEN
    RAISE EXCEPTION 'invalid job inputs';
  END IF;
  SELECT * INTO v_user FROM public.zyrixen_users WHERE id=p_user_id FOR UPDATE;
  IF NOT FOUND THEN
    RETURN jsonb_build_object('ok',false,'reason','not_found');
  END IF;
  IF v_user.banned THEN
    RETURN jsonb_build_object('ok',false,'reason','banned');
  END IF;
  SELECT * INTO v_existing FROM public.zyrixen_jobs WHERE request_id=p_request_id;
  IF FOUND THEN
    IF v_existing.user_id IS DISTINCT FROM p_user_id
       OR v_existing.source_digest IS DISTINCT FROM p_source_digest
       OR v_existing.source_chars IS DISTINCT FROM p_source_chars
       OR v_existing.transformations IS DISTINCT FROM p_transformations THEN
      RETURN jsonb_build_object('ok',false,'reason','request_id_conflict');
    END IF;
    RETURN jsonb_build_object('ok',true,'replayed',true,'charged',0,
      'credits',v_user.credits,'unlimited',v_user.unlimited,'deob_count',v_user.deob_count);
  END IF;
  SELECT enabled,maintenance INTO v_enabled,v_maintenance
    FROM public.zyrixen_config WHERE id=1;
  IF NOT COALESCE(v_enabled,false) OR COALESCE(v_maintenance,true) THEN
    RETURN jsonb_build_object('ok',false,'reason','maintenance');
  END IF;
  v_charge := CASE WHEN p_transformations>0 AND NOT v_user.unlimited THEN 1 ELSE 0 END;
  IF v_charge=1 AND v_user.credits < 1 THEN
    RETURN jsonb_build_object('ok',false,'reason','no_credits');
  END IF;
  UPDATE public.zyrixen_users
    SET credits=credits-v_charge,deob_count=deob_count+1,last_seen=now()
    WHERE id=p_user_id RETURNING * INTO v_user;
  INSERT INTO public.zyrixen_jobs(source_chars,transformations,user_id,request_id,source_digest)
    VALUES(p_source_chars,p_transformations,p_user_id,p_request_id,p_source_digest);
  IF v_charge=1 THEN
    INSERT INTO public.zyrixen_credit_events(user_id,request_id,delta,reason)
      VALUES(p_user_id,p_request_id,-1,'deob');
  END IF;
  RETURN jsonb_build_object('ok',true,'replayed',false,'charged',v_charge,
    'credits',v_user.credits,'unlimited',v_user.unlimited,'deob_count',v_user.deob_count);
END;
$fn$;
REVOKE ALL ON FUNCTION public.zyrixen_complete_job(uuid,uuid,integer,integer,text)
  FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.zyrixen_complete_job(uuid,uuid,integer,integer,text)
  TO service_role;
