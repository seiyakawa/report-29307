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

## reports テーブル

| Column      | Type       | Option                        |
| ----------- | ---------- | ----------------------------- |
| date        | string     | null: false                   |
| name        | string     | null: false                   |
| purpose     | text       | null: false                   |
| outcome     | text       | null: false                   |
| action_plan | text       | null: false                   |
| other       | text       |                               |
| user        | references | null: false, foreign_key:true |

### Association

- belongs_to :user