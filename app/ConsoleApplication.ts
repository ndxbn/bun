export default class ConsoleApplication {
	/**
	 * １つのタスクを渡して、実行する。
	 *
	 * @param {Function} task - A function to be executed. It takes no arguments and returns a value of type R.
	 * @return {this} The current instance to allow method chaining.
	 */
	executeSync<R>(task: (app: this) => R): this {
		task(this);
		return this;
	}

	/**
	 * 終了処理。
	 * リソースの開放等がある場合があるため、直接 process.exit() を使わず、このメソッドを利用すること。
	 *
	 * @param code
	 */
	exit(code = 0): void {
		// close resources
		/* noop */

		// exit
		process.exit(code);
	}
}
