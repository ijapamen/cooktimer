
[![Image from Gyazo](https://i.gyazo.com/e2387e4c61d3b85083c08fc662cc9c89.png)](https://gyazo.com/e2387e4c61d3b85083c08fc662cc9c89)

<br>

### タイマー付きレシピアプリ 
# **COOK TIMER**


<br>
<br>

# アプリケーション概要


[![Image from Gyazo](https://i.gyazo.com/2e2e1d9f642cd272bce3699d5eda025b.png)](https://gyazo.com/2e2e1d9f642cd272bce3699d5eda025b)

## 1. **レシピを見ながらすぐにタイマーを使える！**  
レシピと同じページに配置していることで、いちいちタイマーアプリを開いたり、キッチンタイマーを押しに行かなくても済むようになります。

## 2. **レシピを一覧から探せる！**  
献立を考える手間を省くために、メニューを写真で一覧で見れるようにすることで、直感で食べたいメニューを選択しやすくなっています。

<br>

## URL

http://18.180.221.158

<br>

## テスト用アカウント
「ゲストログイン(閲覧用)」からログインできます。

<br>

## Basic認証
・ID : admin  
・Pass : 2222

<br>

## 目指した課題解決
家事で忙しく、できるなら料理は時短で作りたい主婦の、献立を考える時間や、キッチンタイマーを押しに行く時間といった無駄な時間、そして「めんどくさい」という気持ちを取り除きたい！そんな気持ちからこのアプリを作りました。

<br>
<br>

# アプリケーションの機能一覧（使用した技術）
<br>

### 1. ユーザー管理機能（devise）
### 2. レシピ投稿機能（ActiveStorage)(ActiveHash)  ●画像アップロード先：AWS S3
### 3. レシピ一覧表示機能
### 4. レシピ詳細表示機能
### 5. レシピ削除機能
### 6. レシピ編集機能
### 7. タイマー機能（JavaScript）

<br>

### ●デプロイ：AWS EC2  

<br>

## 1.ユーザー管理機能
* ユーザーを新しく登録できる
* ユーザー登録が完了している場合、ログインすることができる
* ログアウトができる
* 入力に不足があるとエラーメッセージを日本語で表示する（i18n）
<br>\
[![Image from Gyazo](https://i.gyazo.com/fb8b2cba64a7b779f70ee4008e0206e7.gif)](https://gyazo.com/fb8b2cba64a7b779f70ee4008e0206e7)

<br>

## 2.レシピ投稿機能
* 写真・画像を投稿できる（mini_magick）（image_processing 'ver1.2'）
* 料理名、材料、調理手順が投稿できる
* 入力に不足があるとエラーメッセージを日本語で表示する（i18n）
<br>\
[![Image from Gyazo](https://i.gyazo.com/15f891ab3108daf8167dc6d19e652431.gif)](https://gyazo.com/15f891ab3108daf8167dc6d19e652431)

<br>

## 3.レシピ一覧表示機能
* 投稿したレシピを一覧で表示できる
* それぞれのレシピには写真が整列表示される
<br>\
[![Image from Gyazo](https://i.gyazo.com/559849f8debeeb5a45773bc2ad495627.gif)](https://gyazo.com/559849f8debeeb5a45773bc2ad495627)

<br>

## 4.レシピ詳細表示機能
* 写真、料理名、材料、調理手順が表示される
<br>\
[![Image from Gyazo](https://i.gyazo.com/8788d521aa48d584f51cfff5a8e4b4b1.gif)](https://gyazo.com/8788d521aa48d584f51cfff5a8e4b4b1)

<br>

## 5.レシピ削除機能
* レシピを削除できる
<br>\
[![Image from Gyazo](https://i.gyazo.com/033d1979547c28889f1caddada7ef4c0.gif)](https://gyazo.com/033d1979547c28889f1caddada7ef4c0)

<br>

## 6.レシピ編集機能
* レシピの内容を変更できる
<br>\
[![Image from Gyazo](https://i.gyazo.com/db0af4cba3a24c1d3743422cb1ed12e4.gif)](https://gyazo.com/db0af4cba3a24c1d3743422cb1ed12e4)

<br>

## 7.タイマー機能
* 時間を設定し、時間になればアラーム音が鳴る
* アラーム音を途中で止められる
<br>\
[![Image from Gyazo](https://i.gyazo.com/f6241e67147d8f9a584833d56282bc10.gif)](https://gyazo.com/f6241e67147d8f9a584833d56282bc10)

<br>
<br>

# 実装予定の機能

* 複数画像投稿
* 「材料」の表示をより見やすく改良
* 和・洋・中のジャンル別や素材別での表示
* ジャンルや材料からレシピを検索

<br>
<br>

# データベースの設計

[![Image from Gyazo](https://i.gyazo.com/9424b98a1ed1076c791af0e5c2fdf085.png)](https://gyazo.com/9424b98a1ed1076c791af0e5c2fdf085)


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

<br>

### Association

- has_many :recipes

<br>

## recipes テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| person_id       | integer    | null: false                    |
| material        | text       | null: false                    |
| step1           | text       | null: false                    |
| step2           | text       |                                |
| step3           | text       |                                |
| step4           | text       |                                |
| user            | references | null: false, foreign_key: true |

<br>

### Association

- belongs_to :user

<br>
<br>

# ローカルでの動作方法
## 動作方法
```
$ git clone https://github.com/ijapamen/cooktimer.git
$ cd cooktimer
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
👉 http://localhost:3000
```

## バージョン
```ruby '2.6.5'```  
```Rails '6.0.0'```  
```mysql2 '0.5.3'```