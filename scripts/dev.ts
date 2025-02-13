import { parseArgs } from "node:util";
import { $, type ShellError } from "bun";
import type { PackageJson } from "type-fest";
import packageJson from "../package.json" with { type: "json" };

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
]);

/**
 * @var
 * 0: It ran in empty repository.<br>
 * 1: The repository may only contain the "Initial commit".
 *     This usually happens when you create repo using the "Initialize this repository with:" option.
 */
const countCommits = Number.parseInt(await $`git log --oneline | wc -l`.text());
if (countCommits <= 1) {
	// main tasks
	const repoName: string | undefined = new URL(import.meta.url).href
		.split("/")
		// [..., -3: project root dir, -2: "scripts", -1: "dev.ts"]
		.at(-3);
	if (repoName == null) {
		throw new Error("cannot get cwd name");
	}

	// package.json placeholders
	const newPackageJson: PackageJson = {};
	// name
	if (packageJson.name == null || packageJson.name === "<default>") {
		newPackageJson.name = repoName;
	}

	// pick GitHub Actions CI
	if (values.coveralls ?? false) {
		await Bun.file(".github/workflows/coverage.yaml").delete();
	} else {
		await Bun.file(".github/workflows/coverage.coveralls.yaml").delete();
	}

	// ensure ".env" file
	if (!Bun.file(".env").exists()) {
		await Bun.write(".env", Bun.file(".env.example"));
	}

	// make initial commit
	await $`bun fmt`;
	await $`git add .`;
	await $`git commit --amend -m "Initial commit (via bun create)"`.catch(
		(reason: ShellError) => {
			// fatal: You have nothing to amend
			if (reason.exitCode === 128) {
				return;
			}
			throw reason;
		},
	);
}

console.log("To get started developing: edit src/server.ts and `bun start`");
