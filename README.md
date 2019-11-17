#enshre(エンシェア）
自分の持っている周辺機器などをシェアできる掲示板です。楽天の売り上げランキングから欲しいものリストなどもピックアップできます。就活用のポートフォリオとして製作しました。

# テストユーザーログイン
- email: test@test.com
- password: test

※トップページから簡単ログインでログイン可能です。

# リンク
- 本アプリ：https://enshare.info/

# 注目して欲しいところ
- 環境開発からDockerを使用している。
- circleciを使って自動テストをしてる。
- インフラをAWS

# 使用技術
- Ruby 2.6.3
- Ruby on Rails 5.2.3
- MySQL 5.7
- SASS
- AWS
  - EC2/ALB
  - RDS for MySQL
  - S3
  - Route53
  - Certificate Manager
  - VPC
- Docker
- CircleCI
- GitHub

# クラウドアーキテクチャ
![AWS Networking (updated)](https://user-images.githubusercontent.com/26785257/69001806-81d84e80-0928-11ea-8c63-1888db10a518.png)

# 機能一覧
- ユーザー登録、ログイン機能全般
- 簡単ログイン
- ユーザー間でのフォローフォロワー機能
- 記事投稿機能(CRUD)
- 画像投稿機能（carrierwave, aws/fog）
- 記事一覧表示の際のページネーション機能(kaminari)
- 外部API(rakutenAPI)を叩いてコンテンツを表示
- 人気楽天ランキング表示機能
- いいね機能
- want機能

# テスト
- RSpec
  - 統合テスト
  - 単体テスト
