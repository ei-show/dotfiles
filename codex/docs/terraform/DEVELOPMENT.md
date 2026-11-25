# Terraform Development

## 目的

この文書は、Terraform コードを実装、変更、レビューするときの共通方針を定めます。
具体的な provider、backend、module 構成、環境名、変数、state 管理は、対象
リポジトリ内の設定と設計文書に従ってください。

## 実装方針

- 既存の module 構成、命名、変数定義、出力定義、backend 設定を読んでから変更する。
- 変更は要求された範囲に絞り、無関係なリファクタリングや provider 更新を混ぜない。
- 外部環境、state、リモートリソースへ副作用を与える操作は境界を明確にする。
- 既存の CI、pre-commit、lint、validation 設定がある場合は、それを優先する。
- 挙動を変える場合は、plan 結果で変更対象と意図が確認できるようにする。

## リソース定義とドキュメントの配置

- 同じ種類のリソースは、対象 module でその種類を管理している既存の `.tf` ファイルに追加する。
- 対応するファイルがない場合は、Workflows の `workflow.tf` のようにリソースの種類が分かる名前で作成する。
- リソース固有の仕様と操作手順は `docs/` 配下に記載し、README からリンクする。

## Google Cloud

- Workflows から Google Cloud の API を呼ぶ場合は、必要な操作と引数に対応する組み込みコネクタを `call` で使う。
- 外部 API やコネクタが対応していない操作には、Workflows の HTTP 関数を使う。
- Workflows のサービスエージェントには、プロジェクト番号を使って `service-PROJECT_NUMBER@gcp-sa-workflows.iam.gserviceaccount.com` を IAM に直接指定する。
- Workflows の初回デプロイでサービスエージェントが自動作成される順序を考慮し、この用途でベータ版の `google_project_service_identity` を追加しない。
- サービスアカウント自体の IAM は、直接付与するポリシー全体を単一の Terraform 構成が管理できる場合に `google_service_account_iam_policy` を使う。
- 既存のサービスアカウントに導入するときは、維持する直接付与をすべて定義し、同じポリシーを変更する別の state や運用手順がないことを確認する。
- サービスアカウントが他のリソースを利用するための権限は、そのリソースまたは該当プロジェクトの IAM ポリシーに設定する。
- サービスアカウントに GCS オブジェクトの読み書きを許可するときは、対象バケットに `roles/storage.objectUser` を付与することを基本とする。
- `roles/storage.objectUser` にはオブジェクトの削除権限も含まれるため、読み取り専用や削除禁止の要件がある場合は操作範囲に合うロールを選ぶ。

## Terraform コマンド

確認目的で Terraform コマンドを実行する場合は、原則として次の範囲に限定します。

```sh
terraform fmt -check
terraform validate
terraform plan
```

`terraform plan` は、backend、workspace、variables、credentials、対象環境を確認してから
実行してください。plan 実行によりリモートサービスへの読み取りや state lock が発生する
可能性がある場合は、ユーザーの明示指示を確認してください。

## 禁止コマンド

次のコマンドは絶対に実行しないでください。

```sh
terraform apply
```

実際の適用は、ユーザーまたは運用担当者が明示的に行う前提です。`terraform apply` の
実行が必要に見える場合でも、代わりに必要性、想定差分、確認済みの plan 結果を報告し、
実行は依頼者側に委ねてください。

## 副作用の扱い

- `terraform import`、`terraform state`、`terraform taint`、`terraform untaint`、
  `terraform destroy` など、state や実環境を変更し得るコマンドは、ユーザーの明示指示が
  ない限り実行しないでください。
- provider 認証情報、backend 設定、workspace の切り替えが必要な場合は、対象と理由を
  明確にしてから作業してください。
- 実行できなかった検証がある場合は、理由と残るリスクを報告してください。
