# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchase

## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------  | ----------- |
| images           | string  | null: false |
| items_name       | string  | null: false |
| description      | text    | null: false |
| category         | string  | null: false |
| states           | string  | null: false |
| shipping_charges | string  | null: false |
| delivery_area    | string  | null: false |
| price            | numeric | null: false |

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

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| card_number      | numeric | null: false |
| expiration_month | date    | null: false |
| expiration_date  | date    | null: false |
| security_code    | numeric | null: false |
| postal_code      | numeric | null: false |
| prefectures      | string  | null: false |
| municipality     | string  | null: false |
| address          | string  | null: false |
| building_name    | string  |             |
| phone_number     | numeric | null: false |

### Association
- belongs_to :users
- belongs_to :items
