# 開発ガイドライン

## はじめに

このガイドラインは、プロジェクトの開発における標準的な手順と規約を定めたものです。
チームメンバー全員がこのガイドラインに従うことで、コードの品質を維持し、効率的な開発を進めることができます。

## コーディング規約

### 命名規則
- 変数名、関数名はキャメルケース（例：`userName`）を使用してください
- クラス名はパスカルケース（例：`UserAccount`）を使用してください
- 定数は大文字のスネークケース（例：`MAX_RETRY_COUNT`）を使用してください

### コードフォーマット

- `.editorconfig` および `biome.json` の設定内容を尊重してください
- [Biome](https://biomejs.dev/) をフォーマッタとして使用します

## Git 運用ルール

### ブランチ戦略
GitHub Flow で開発をしています。

- `main` は常にデプロイ可能な状態を維持する本番環境用のブランチです
- 新機能の開発やバグ修正は `main` から直接ブランチを作成してください
- 新機能の開発やバグ修正をするブランチは、Git Flow のように `feat/｛機能名｝` や `fix/｛バグ内容｝`を使ってください
- 作業中は定期的にリモートブランチにプッシュしてください
- 作業が完了したらプルリクエストを作成し、レビューを依頼してください
- レビュー後、承認されたらプルリクエストを `main` にマージしてください
- マージ後は自動的にデプロイされることを想定してください

### コミットメッセージ
- 
- コミットメッセージは Conventional Commit にしてください
- コミットメッセージのテンプレートとして .gitmessage.txt を設定していただいても構いません

## テスト

- 新機能の追加時には必ずテストを作成してください
- テストカバレッジについて、Branch Coverage で80％以上を目指すようにしてください
- [Google Testing Blog](https://testing.googleblog.com/2010/12/test-sizes.html) のテストサイズを意識してテストケースを実装してください
- テストケースを実装するファイルには、テストサイズごとに `.small.test` `.medium.test` `.large.test` プレフィックスをつけてください
- 各サイズのテストは、以下のタイミングで実行されることを意識してください
  - small: pre-commit   
  - medium: pre-push
  - large: main ブランチにマージされる前
  - Enormous: リリース前
- それぞれのテストの実行は、GitHook や CI/CD パイプラインに組み込んでください

### テストサイズ

テストサイズとは、テストの実行時間や依存関係、スコープなどによってテストを分類する考え方です。主に以下の4つのサイズに分類されます。
テストピラミッドの考え方に基づき、Small テストを多く、Medium テストを中程度、Large テストを少なく、Enormous テストを最小限にすることを意識してください。

#### Small テスト

- 単一のクラスやメソッドなど、小さな単位をテストします
- 外部依存関係（ファイルシステム、ネットワーク、データベースなど）を持ちません
- モックやスタブを使用して依存関係を置き換えます
- 実行時間が非常に短く（ミリ秒単位）、高速に実行できます
- 単体テスト（Unit Test）と呼ばれることが多いです

#### Medium テスト

- 複数のクラスやコンポーネント間の連携をテストします
- 限定的な外部依存関係を持つことがあります（例：インメモリデータベース）
- 実際の依存関係を使用することもありますが、テスト用の軽量な代替を使うことが多いです
- 実行時間は数秒程度です
- 統合テスト（Integration Test）の一部と考えられます

#### Large テスト

- システム全体や大きなサブシステムの動作をテストします
- 実際の外部依存関係（本番環境に近いデータベース、APIなど）を使用します
- エンドツーエンドの動作や複雑なシナリオをテストします
- 実行時間は数十秒から数分かかることがあります
- エンドツーエンドテスト（E2E Test）や機能テスト（Functional Test）と呼ばれることが多いです

#### Enormous テスト

- 複数のシステムにまたがる統合テストや負荷テストなどを含みます
- 本番環境に非常に近い環境で実行されます
- 実行時間が長く（数分から数時間）、リソースを多く消費します
- パフォーマンステストや負荷テスト、長時間安定性テストなどが含まれます

#### 各テストサイズの長所と短所

- Small テストは高速で信頼性が高く、問題の特定が容易ですが、システム全体の動作を保証するものではありません
- Medium テストはコンポーネント間の連携を確認できますが、Small テストより実行時間が長くなります
- Large テストはシステム全体の動作を確認できますが、実行時間が長く、失敗した場合の原因特定が難しいことがあります
- Enormous テストは本番環境に近い状態でのテストが可能ですが、非常にコストがかかります

## ドキュメント

- APIの変更があった場合は、ドキュメントも更新してください
- コードには適切なコメントを入れてください
- 複雑なロジックには、その意図を説明するコメントを追加してください

- ドキュメントは `docs/` ディレクトリに作成してください
- このディレクトリは GitHub Pages を用いてそのまま Web ブラウザから閲覧可能なドキュメントとしても使用されることを想定してください
- できるだけ機能ごとにディレクトリを分けてください
- index.md には概要やユースケース、実装例を書いてください
- 他の機能やライブラリを組み合わせて使う、複雑で発展的な内容はファイルを分け、そのファイルへの適切な導線を作ってください
- ほとんどの場合は index.md の末尾や適切な章に書くことになるでしょう

## レビュー

- プルリクエストを作成する前に、自分のコードを見直してください
- レビューコメントには丁寧に対応してください
- レビューは技術的な観点だけでなく、ビジネス要件も考慮してください

## セキュリティ

- 認証情報やAPIキーなどの機密情報はコードにハードコーディングしないでください
- ユーザー入力は必ず検証し、インジェクション攻撃を防止してください
- 定期的にセキュリティスキャンを実施してください

## パフォーマンス

- 大量のデータを扱う処理は最適化してください
- 不必要なネットワークリクエストは避けてください
- リソースの使用状況を定期的に監視してください

## 最後に

このガイドラインは、プロジェクトの進行に合わせて更新されることがあります。改善提案がある場合は、チームに共有してください。
