## users テーブル
| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nickname              | string   | null: false |
| email                 |
| password              |
| password_confirmation |
| last_name             |
| first_name            |
| last_name_kana        |
| first_name_kana       |
| birth_date            |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column             | Type      | Options          |
| ------------------ | --------- | ---------------- |
| image              | 
| item_name          |
| item_info          |
| category           |
| status             |
| shipping_fee       |
| item_prefecture    |
| scheduled_delivery |
| price              |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column             | Type      | Options         |
| ------------------ | --------- | --------------- |
| credit_number      |
| expiration_month   |
| expiration_year    |
| cvc                |
| postal_code        |
| prefecture         |
| city               |
| address            |
| building           |
| phone_number       |

### Association
- belongs_to :user
- belongs_to :item