## users テーブル

|Column             |Type   |Options                    |
|-------------------|-------|---------------------------|
|nickname           |string |null: false                |
|email              |string |null: false, unique: true  |
|encrypted_password |string |null: false                |
|family_name        |string |null: false                |
|fist_name          |string |null: false                |
|family_name_kana   |string |null: false                |
|first_name_kana    |string |null: false                |
|birthday           |date   |null: false                |

### Association

- has_many :items
- has_many :purchases


## items テーブル

|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
|name             |string     |null: false                    |
|text             |text       |null: false                    |
|category_id      |integer    |null: false                    |
|status_id        |integer    |null: false                    |
|charge_id        |integer    |null: false                    |
|prefecture_id    |integer    |null: false                    |
|delivery_days_id |integer    |null: false                    |
|price            |integer    |null: false                    |
|user             |references |null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|item   |references |null: false, foreign_key: true |
|user   |references |null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :order


## orders テーブル

|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|postal_code   |string     |null: false                    |
|prefecture_id |integer    |null: false                    |
|municipality  |string     |null: false                    |
|house_number  |string     |null: false                    |
|building      |string     |                               |
|phone_number  |string     |null: false                    |
|purchase      |references |null: false, foreign_key: true |


### Association

- belongs_to :purchase