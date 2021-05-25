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
- has_many :purchase

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| items_name         | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| state_id           | integer | null: false |
| shipping_charge_id | integer | null: false |
| prefectures_id     | integer | null: false |
| days_to_ship_id    | integer | null: false |
| price              | numeric | null: false |

### Association
- belongs_to :users
- has_many :comments
- has_many :purchase

## comments テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   |text    | null: false |

### Association
- belongs_to :users
- belongs_to :items

## purchase テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_code      | string  | null: false |
| prefectures_id   | integer | null: false |
| municipality     | string  | null: false |
| address          | string  | null: false |
| building_name    | string  |             |
| phone_number     | string  | null: false |

### Association
- belongs_to :users
- belongs_to :items

## purchase_management テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items