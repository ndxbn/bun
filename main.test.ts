import { expect, test } from "bun:test";
import { main } from "./";

test("main test", () => {
	expect(main()).toBeString();
});
