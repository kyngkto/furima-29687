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
| birth_year |  string  |  null:false |
| birth_mouth|  string  |  null:false |
| birth_day  |  string  |  null:false |
|   email    |  string  |  null:false |
|   password |  string  |  null:false |

### Association

- has_many :items
- has_one :delver_addresses
- has_many :wallets


## deliver_addressesテーブル

|   column   |   Type   |   Option   |
|  --------  |  ------  |  --------  |
|   user_id  |references| null:false |
|  zip_code  |  integer | null:false |
| prefecture |  string  | null:false |
|    city    |  string  | null:false |
|  address1  |  string  | null:false |
|  address2  |  string  | null:false |
|  telephone |  string  | null:false |

### Association

- belong_to :users


## walletsテーブル

|    Column     |   Type   |   Option   |
|  -----------  | -------- |  --------  |
|    user_id    |references| null:false |
|  card_number  |  integer | null:false |
|expiration_date|  integer | null:false |
| security_code |  integer | null:false |

### Association
 - belong_to :users

## itemsテーブル

|    Column     |   Type   |     Option   |
|   ---------   |  ------  |  ----------  |
|   item_name   |  string  |  null:false  |
|   category    |  string  |  null:false  |
|     price     |  integer |  null:false  |
|   condition   |  string  |  null:false  |
| delivery_fee  |  string  |  null:false  |
|    area       |  string  |  null:false  |
|date_of_shipment| string  |  null:false  |

### Association

- belong_to :users