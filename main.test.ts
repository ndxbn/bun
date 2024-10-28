import { main } from "./";

describe("main test", () => {
	it("should return string", () => {
		expect(main()).toBeString();
	});
});
