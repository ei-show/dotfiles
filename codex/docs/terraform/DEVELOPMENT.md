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
