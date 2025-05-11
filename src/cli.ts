#!/usr/bin/env bun
import { parseArgs } from "node:util";
import ConsoleApplication from "@/ConsoleApplication.ts";
import packageJson from "../package.json" with { type: "json" };

const app = new ConsoleApplication();

const HELP_MESSAGE = `NAME
	${packageJson.name} - ${packageJson.description}
SYNOPSIS
	bun cli [OPTIONS]
OPTIONS:
	General options
		-n, --dry-run  Print the commands that would be executed, but do not execute them (except in certain circumstances).
	Getting Help
		-V, --version  Show version number.
		-h, --help     Show help (this message).
		-v, --verbose  Show verbose output. -VV for more verbose, -VVV for even more verbose.
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
		"dry-run": {
			type: "boolean",
			short: "n",
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
	// values.verbose は [true, true] みたいに個数分の True が入る。
	console.log(values.verbose);
}

if (values["dry-run"]) {
	// todo: app の出力を含むコンテナのうち、Logger 以外のすべてをモックにする
	console.log("dry-run");
}
