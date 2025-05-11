import { expect, test } from "bun:test";
import { main } from "./index.ts";

declare module "bun" {
	interface Env {
		REDIS_URL: string;
	}
}

test("main test", async () => {
	const hello = await main();
	expect(hello).toBe("hello, bun world!");
});

test("env", () => {
	expect(process.env.NODE_ENV).toBe("test");
	expect(process.env.REDIS_URL).toBe("redis://local:6379");
});
