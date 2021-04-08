## users テーブル
| Column                | Type     | Options                    |
| --------------------- | -------- | -------------------------- |
| nickname              | string   | null: false , unique: true |
| email                 | string   | null: false , unique: true |
| password              | string   | null: false                |
| last_name             | string   | null: false                |
| first_name            | string   | null: false                |
| last_name_kana        | string   | null: false                |
| first_name_kana       | string   | null: false                |
| birth_date            | date     | null: false                |

### Association
- has_many :items
- has_many :orders

## items テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item_name   | string     | null: false       |
| item_info   | text       | null: false       |
| price       | integer    | null: false       |
| user_id     | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal_code        | integer    | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building           | string     | null: false       |
| phone_number       | integer    | null: false       |
| order_id           | references | foreign_key: true |

### Association
- belongs_to :order