import { parseArgs } from "node:util";
import { styleText } from "node:util";
import { $, type ShellError } from "bun";

if (process.env.NODE_ENV !== "development") {
	console.error("NODE_ENV is not development.");
	process.exit(1);
}

const { values } = parseArgs({
	args: Bun.argv,
	options: {
		coveralls: {
			type: "boolean",
		},
	},
	strict: false,
});

await Promise.all([
	$`bunx lefthook install`,
	$`git config commit.template .gitmessage.txt`,
	(async () => {
		// ensure ".env" file
		if (!(await Bun.file(".env").exists())) {
			await Bun.write(".env", Bun.file(".env.example"));
		}
	})(),
]);

/**
 * @var
 * 0: It ran in an empty repository.<br>
 * 1: The repository may only contain the "Initial commit".
 *     This usually happens when you create a repo using the "Initialize this repository with:" option.
 */
const countCommits = Number.parseInt(await $`git log --oneline | wc -l`.text());
if (countCommits <= 1) {
	// pick GitHub Actions to CI
	if (values.coveralls ?? false) {
		await Bun.file(".github/workflows/coverage.yaml").delete();
	} else {
		await Bun.file(".github/workflows/coverage.coveralls.yaml").delete();
	}

	// make "initial commit"
	await $`bun fmt`;
	await $`git add .`;
	await $`git commit --amend -m "Initial commit (via bun create)"`
		.quiet()
		.catch((reason: ShellError) => {
			// fatal: You have nothing to amend
			if (reason.exitCode === 128) {
				return;
			}
			throw reason;
		});
}

// At last, print the next step message
console.log(`${styleText(["dim"], "# ")} Next Steps:

  ${styleText(["cyan"], "docker compose up -d")}: start middlewares
  ${styleText(["cyan"], "bun cli -h")} or ${styleText(["cyan"], "bun start")}`);
