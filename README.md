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
| birth_year             | integer | null: false              |
| birth_month            | integer | null: false              |
| birth_day              | integer | null: false              |

### Association

- has_many   :items
- has_many   :purchases


- belongs_to_active_hash :birth_year
- belongs_to_active_hash :birth_month
- belongs_to_active_hash :birth_day


  

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | text       | null: false                    |
| item_name       | string     | null: false                    |
| explain         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| quality_id      | integer    | null: false                    |
| cost            | integer    | null: false                    |
| region_id       | integer    | null: false                    |
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :purchases 


- belongs_to_active_hash :category
- belongs_to_active_hash :quality
- belongs_to_active_hash :cost
- belongs_to_active_hash :region
- belongs_to_active_hash :day
- belongs_to_active_hash :price





## addresses テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| home_number     | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| item            | references | null: false, foreign_key: true |

### Association

- has_one    :purchases

- belongs_to_active_hash :prefecture




## purchases テーブル

| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| user            | references    | null: false                    |
| item            | references    | null: false                    |
| address         | references    | null: false                    |


### Association

belongs_to :users
belongs_to :items
belongs_to :addresses
