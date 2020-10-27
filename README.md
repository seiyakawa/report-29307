# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |

### Association

- has_many :reports
- has_many :comments

## reports テーブル

| Column      | Type       | Option                        |
| ----------- | ---------- | ----------------------------- |
| date        | date       | null: false                   |
| name        | string     | null: false                   |
| purpose     | text       | null: false                   |
| outcome     | text       | null: false                   |
| action_plan | text       | null: false                   |
| other       | text       |                               |
| user        | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column | Type       | Option                        |
| ------ | ---------- | ----------------------------- |
| text   | text       | null: false                   |
| user   | references | null: false, foreign_key:true |
| report | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :report

# 1アプリケーション名
Cool log

# 2アプリケーション概要
メイン  
・ユーザー登録機能  
・レポート投稿機能  
・レポートへのコメント機能  
サブ  
・レポート一覧表示  
・レポート詳細表示  
・レポート編集  
・レポート削除  
・マイページ  
・投稿者の投稿一覧表示  
・画像のプレビュー機能  

# 3URL
https://report-29307.herokuapp.com/

# 4テスト用アカウント
## basic認証
Username:report
Password:1111ログイン
## ログイン
- 投稿者
Eメール：toukou@com  
パスワード：abc123  
- コメント
Eメール：komento@com  
パスワード：123abc  

# 5利用方法
- テスト用アカウント（投稿者）でログインを行う。
- 投稿ボタンをクリックし、項目を記入し投稿を行う。
- ログアウトを行い、テスト用アカウント（コメント）でログインを行う。
- トップページに表示されているレポートをクリックするとコメント投稿フォームがある。
- コメントを投稿するとコメント一覧に投稿内容が表示される。

# 6目指した課題解決
新人営業マンの日報の提出をわかりやすくかつやりやすくしたかった。

# 7洗い出した要件
| 機能            | 目的	| 詳細	| ストーリー(ユースケース) |
| -------------- | ---- | ----- | ----------------------------- |
| ユーザー管理機能	|ユーザー毎に情報を管理できるようにする	|新規登録、ログインボタンが存在し必須項目（ニックネーム、Eメール、パスワード）を入力するとアカウントが作成出来るようにする	| ・トップ画面を開いた際に新規登録とログインボタンが表示されている  
・一度新規登録を行えばアカウントが作成されそれ以降はログインを行う |