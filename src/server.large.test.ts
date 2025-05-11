import { expect, test } from "bun:test";
import { default as app } from "./server";

test("server test", async () => {
	// setup
	const server = Bun.serve(app);

	// GET /
	const fetchResponse = await fetch(`http://localhost:${server.port}`);
	expect(fetchResponse.status).toBe(200);

	// ミドルウェアへの疎通
	const responseBody = await fetchResponse.json();
	expect(responseBody.Redis).toBe("OK");
	expect(responseBody.S3).toBe("OK");

	// teardown
	await server.stop();
});
