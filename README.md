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

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :recipes

## recipes テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| people_id       | integer    | null: false                    |
| material        | text       | null: false                    |
| step1           | text       | null: false                    |
| step2           | text       |                                |
| step3           | text       |                                |
| step4           | text       |                                |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user