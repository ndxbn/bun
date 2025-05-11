import {RedisClient} from "bun";
import type {Serve} from "bun";

// Clients
const redis = new RedisClient();

export default {
	async fetch(req) {
		const responseBody = JSON.parse("{}");
		responseBody.url = req.url;
		responseBody.Redis = "NG";

		// Redis Connection
		if (!redis.connected) {
			await redis.connect();
		}
		const pong: "PONG" = await redis.send("PING", []);
		if (pong === "PONG") {
			responseBody.Redis = "OK";
		}

		//
		const response = new Response(JSON.stringify(responseBody));
		response.headers.set("Content-Type", "application/json");

		return response;
	},

} satisfies Serve;
