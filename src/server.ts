import type {Serve} from "bun";

export default {
	fetch(req) {
		const responseBody = JSON.stringify([
			req.method,
			req.url,
			req.headers
		]);
		const response = new Response(responseBody);
		response.headers.set("Content-Type", "application/json");

		return response;
	},
} satisfies Serve;
