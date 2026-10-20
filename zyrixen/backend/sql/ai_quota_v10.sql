-- Zyrixen Engine 1.0: quota for opt-in LLM analysis (two paid-gateway calls/hour/account).
-- Stores only usage counters; never source code, API credentials or AI output.
CREATE TABLE IF NOT EXISTS public.zyrixen_ai_quota (
  user_id uuid PRIMARY KEY REFERENCES public.zyrixen_users(id) ON DELETE CASCADE,
  period_start timestamptz NOT NULL DEFAULT date_trunc('hour',now()),
  uses integer NOT NULL DEFAULT 0 CHECK (uses BETWEEN 0 AND 2)
);
ALTER TABLE public.zyrixen_ai_quota ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON TABLE public.zyrixen_ai_quota FROM PUBLIC, anon, authenticated;
GRANT SELECT, INSERT, UPDATE ON TABLE public.zyrixen_ai_quota TO service_role;

CREATE OR REPLACE FUNCTION public.zyrixen_consume_ai_quota(p_user_id uuid)
RETURNS boolean
LANGUAGE plpgsql SECURITY DEFINER
SET search_path TO 'public','pg_temp'
AS $fn$
DECLARE v_id uuid;
BEGIN
  IF p_user_id IS NULL THEN RETURN false; END IF;
  INSERT INTO public.zyrixen_ai_quota (user_id,period_start,uses)
    VALUES (p_user_id,date_trunc('hour',now()),1)
    ON CONFLICT(user_id) DO UPDATE
      SET period_start=EXCLUDED.period_start,
          uses=CASE WHEN public.zyrixen_ai_quota.period_start<EXCLUDED.period_start
                    THEN 1 ELSE public.zyrixen_ai_quota.uses+1 END
      WHERE public.zyrixen_ai_quota.period_start<EXCLUDED.period_start
         OR public.zyrixen_ai_quota.uses < 2
    RETURNING user_id INTO v_id;
  RETURN v_id IS NOT NULL;
END;
$fn$;
REVOKE ALL ON FUNCTION public.zyrixen_consume_ai_quota(uuid) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.zyrixen_consume_ai_quota(uuid) TO service_role;
