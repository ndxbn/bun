import {default as app} from './server';
import {expect, test} from "bun:test";

test("server test", async () => {
	const server = Bun.serve(app);
	const fetchResponse = await fetch(`http://localhost:${server.port}`);
	expect(fetchResponse.status).toBe(200);

	await server.stop();
});
