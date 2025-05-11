#!/usr/bin/env bun
import { parseArgs } from "node:util";
import ConsoleApplication from "@/ConsoleApplication.ts";
import packageJson from "../package.json" with { type: "json" };

const app = new ConsoleApplication();

const HELP_MESSAGE = `NAME
	${packageJson.name} - ${packageJson.description}
OPTIONS:
	-v, --version  Show version number
	-h, --help     Show help
	-V, --verbose  Show verbose output. -VV for more verbose, -VVV for even more verbose.
`;

const { values } = parseArgs({
	args: Bun.argv,
	options: {
		//
		version: {
			type: "boolean",
			short: "v",
		},
		help: {
			type: "boolean",
			short: "h",
		},
		// output control
		verbose: {
			type: "boolean",
			short: "V",
			multiple: true,
		},
	},
	strict: false,
});

// --version と --help は特別な存在なので、最初に処理をする
// なぜ特別かといえば、
//   Dockerfile 的に言えば、FROM の直後の TAGS に設定するような、
//   コンパイル言語であれば #define で宣言するような、
//   そういう "prepare" 段階で解決できて、Distributed な状態であれば静的に解決できる処理内容なので。
if (values.version) {
	// CLI ツールという前提があり、フォーマットを変更したいみたいな需要はないはずなので、
	//   app.logger ではなく console.log へ直接出力する
	console.log(packageJson.version);
	app.exit(0);
}

if (values.help) {
	// CLI ツールという前提があり、フォーマットを変更したいみたいな需要はないはずなので、
	//   app.logger ではなく console.log へ直接出力する
	console.log(HELP_MESSAGE);
	app.exit(0);
}

// 以下、通常の処理
if (values.verbose) {
	// todo: app.logger.loglevel で制御するようにする。
	console.log(values.verbose);
}
