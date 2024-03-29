# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false  unique: true|
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchase_managements

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| state_id           | integer    | null: false |
| shipping_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| days_to_ship_id    | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true|

### Association
- belongs_to :user, foreign_key: true
- has_one :comments
- has_one :purchase_management 

## comments テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   |text    | null: false |

### Association
- belongs_to :user
- belongs_to :item

## purchase テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | string     | null: false |
| prefecture_id       | integer    | null: false |
| municipality        | string     | null: false |
| address             | string     | null: false |
| building_name       | string     |             |
| phone_number        | string     | null: false |
| purchase_management | references | null: false, foreign_key: true|

### Association

- belongs_to :purchase_management, foreign_key: true

## purchase_management テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :purchase


