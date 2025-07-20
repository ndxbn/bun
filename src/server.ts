import type { Serve } from "bun";
import { RedisClient, S3Client } from "bun";

// Clients
const redis = new RedisClient();
const s3 = new S3Client();

export default {
	async fetch(req) {
		const responseBody = JSON.parse("{}");
		responseBody.url = req.url;
		responseBody.Redis = "NG";
		responseBody.S3 = "NG";

		// Redis Connection
		if (!redis.connected) {
			await redis.connect();
		}
		const pong: "PONG" = await redis.send("PING", []);
		if (pong === "PONG") {
			responseBody.Redis = "OK";
		}

		// S3 Connection
		try {
			await fetch("http://localhost:9000/minio/health/ready");
			await s3.write("_healthcheck.txt", "");
			await s3.exists("_healthcheck.txt");
			responseBody.S3 = "OK";
		} catch (_) {
			// noop
		}

		//
		const response = new Response(JSON.stringify(responseBody));
		response.headers.set("Content-Type", "application/json");

		return response;
	},
} satisfies Serve;
