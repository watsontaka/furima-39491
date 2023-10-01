# README
# テーブル設計

## users テーブル

| Column                 | Type    | Options                  |
| ---------------------- | ------- | ------------------------ |
| nickname               | string  | null: false              |
| email                  | string  | null: false,unique: true |
| encrypted_password     | string  | null: false              |
| first_name             | string  | null: false              |
| last_name              | string  | null: false              |
| first_katakana         | string  | null: false              |
| last_katakana          | string  | null: false              |
| birth_day              | date    | null: false              |

### Association

- has_many   :items
- has_many   :purchases
  

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explain         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| quality_id      | integer    | null: false                    |
| cost_id         | integer    | null: false                    |
| region_id       | integer    | null: false                    |
| period_id       | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


- belongs_to_active_hash :category
- belongs_to_active_hash :quality
- belongs_to_active_hash :cost
- belongs_to_active_hash :region
- belongs_to_active_hash :period
- belongs_to_active_hash :price




## addresses テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| purchase        | references | null: false, foreign_key: true |
| post_code       | string     | null: false                    |
| region_id       | integer    | null: false                    |
| city            | string     | null: false                    |
| home_number     | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to    :purchase

- belongs_to_active_hash :region




## purchases テーブル

| Column          | Type          | Options                           |
| --------------- | ------------- | --------------------------------- |
| user            | references    | foreign_key: true, null: false    |
| item            | references    | foreign_key: true, null: false    |


### Association

- has_one    :address
- belongs_to :user
- belongs_to :item 
