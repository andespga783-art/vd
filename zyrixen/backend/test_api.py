import os
import tempfile
import unittest

from fastapi.testclient import TestClient

import main

class APITests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.old_db = main.DB
        self.old_token = main.ADMIN_TOKEN
        main.DB = os.path.join(self.temp.name, "test.sqlite")
        main.ADMIN_TOKEN = "test-owner-token"
        self.client = TestClient(main.app)

    def tearDown(self):
        main.DB = self.old_db
        main.ADMIN_TOKEN = self.old_token
        self.temp.cleanup()

    def test_health(self):
        self.assertEqual(self.client.get("/health").json(), {"ok": True})

    def test_admin_rejects_unauthorized(self):
        self.assertEqual(self.client.get("/admin/stats").status_code, 401)

    def test_deobfuscate_and_stats(self):
        response = self.client.post("/deobfuscate", json={"source": r'print("\\72\\105")'})
        self.assertEqual(response.status_code, 200)
        self.assertIn("result", response.json())
        stats = self.client.get("/admin/stats", headers={"Authorization": "Bearer test-owner-token"})
        self.assertEqual(stats.status_code, 200)
        self.assertEqual(stats.json()["count"], 1)

    def test_owner_can_disable_service(self):
        token = {"Authorization": "Bearer test-owner-token"}
        response = self.client.put("/admin/config", headers=token, json={
            "enabled": False,
            "maintenance": True,
            "notice": "Under maintenance",
            "max_chars": 1000
        })
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.client.post("/deobfuscate", json={"source": "print(1)"}).status_code, 503)

if __name__ == "__main__":
    unittest.main()
