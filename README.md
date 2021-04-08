## users テーブル
| Column                | Type     | Options                    |
| --------------------- | -------- | -------------------------- |
| nickname              | string   | null: false , unique: true |
| email                 | string   | null: false , unique: true |
| encrypted_password    | string   | null: false                |
| last_name             | string   | null: false                |
| first_name            | string   | null: false                |
| last_name_kana        | string   | null: false                |
| first_name_kana       | string   | null: false                |
| birth_date            | date     | null: false                |

### Association
- has_many :items
- has_many :orders

## items テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| item_name          | string     | null: false       |
| item_info          | text       | null: false       |
| item_category      | references | foreign_key: true |
| item_status        | references | foreign_key: true |
| shipping_fee       | references | foreign_key: true |
| item_prefecture    | references | foreign_key: true |
| scheduled_delivery | references | foreign_key: true |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal_code        | string     | null: false       |
| prefecture         | references | foreign_key: true |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building           | string     | null: false       |
| phone_number       | string     | null: false       |
| order              | references | foreign_key: true |

### Association
- belongs_to :order