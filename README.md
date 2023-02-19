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

| Column              | Type    | Options     |
|---------------------|---------|-------------|
| name                | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |

* has_many messages
* has_many room_users
* has_many rooms, through: :room_users


## rooms テーブル

| Column              | Type    | Options     |
|---------------------|---------|-------------|
| name                | string  | null: false |

* has_many room_users
* has_many users, through: :room_users


## room_users テーブル

| Column          | Type        | Options     |
|-----------------|-------------|-------------|
| user            | references  | null: false |
| room            | references  | null: false |

* belong_to user
* belong_to room


## messages テーブル
| Column          | Type        | Options     |
|-----------------|-------------|-------------|
| content         | text        | null: false |
| user            | references  | null: false |
| room            | references  | null: false |

* belong_to user
* belong_to room