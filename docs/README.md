## indexes

make static index if you need.

But IMO, if you feel the document will have been large/huge, then we use anyone document generation tool(e.g. [Docusaurus](https://docusaurus.io/docs)) and that may auto-generate index.
目次が必要になるほどドキュメントが大きくなったら、そもそもドキュメント生成ツールを使うべきフェーズだよね。

## entrypoint files implementation

```mermaid
---
title: entrypoint files using which Application class
---
classDiagram
direction LR

class ApplicationBase {
  <<abstract>>
}
class ApplicationInterface {
  <<interface>>
}
%% entrypoint --> each application class
cli-ts_file --> ConsoleApplication: use
serve-ts_file --> HttpApplication: use
import_as_module --> Application: import

%% Application classes extends/implements
ConsoleApplication --|> ApplicationBase
HttpApplication --|> ApplicationBase
Application --|> ApplicationBase
ApplicationBase ..|> ApplicationInterface
```
