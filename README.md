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



#テーブル設計

## usersテーブル

|   Column   |   Type   |  Option     |
|  --------  | -------- |  ---------  |
|   nickname |  string  |  null:false |
| family_name|  string  |  null:false |
| first_name |  string  |  null:false |
| family_name_kana| string| null:false|
| first_name_kana | string| null:false|
|  birthday  |  date    | null:false  |
|   email    |  string  |  null:false |
|   password |  string  |  null:false |

### Association

- has_many :items
- has_many :wallets


## deliver_addressesテーブル

|   column   |   Type   |   Option   |
|  --------  |  ------  |  --------  |
|  wallet    |references| null:false,foreign_key: true |
|  zip_code  |  string  | null:false |
|prefecture_id|  integer  | null:false |
|    city    |  string  | null:false |
|address_line|  string  | null:false |
|Building_name| string  |            |
|  telephone |  string  | null:false |

### Association

- has_one :wallet

## walletsテーブル

|    Column     |   Type   |   Option   |
|  -----------  | -------- |  --------  |
|     user      |references| null:false,foreign_key: true |
|     item      |references| null:false,foreign_key: true |

### Association
- belongs_to :user
- has_many :item

## itemsテーブル

|    Column     |   Type   |     Option   |
|   ---------   |  ------  |  ----------  |
|      name     |  string  |  null:false  |
|   category_id |  integer |  null:false  |
|     price     |  integer |  null:false  |
|  condition_id |  integer |  null:false  |
| delivery_fee_id |  integer |  null:false  |
|    area_id    |  integer |  null:false  |
|date_of_shipment_id| integer |  null:false  |
|   user_id     |references|  foreign_key: true|

### Association

- belongs_to :user