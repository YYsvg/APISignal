# README

### Webアプリに通知機能を持たせられる
### OneSignal
- gem 'httparty'
- github  https://github.com/gazay/gon/blob/master/README.md

#### envを作成する（サーバーサイド）

### 学んだこと
#### クライアントサイドで環境変数を設定する場合、gonを使用する

### できたこと
- ベルの表示
- ウィンドウの表示

### 課題
- ウィンドウの表示が不安定
- サブスクリプション以外の使い方を確認する
- gonの使用方法について
  - 必要？
  - jsファイルのダウンロード（cdnで読み込んでいるのでは？）
  - jsファイルに書くrequire
  - application.html.erb
    - <%= include_gon %>
    - これは通った　
      - appId: '<%= ENV['APP_ID'] %>'
    - これはNameError
    - appId: '<%= gon.app_id %>',

