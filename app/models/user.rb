class User < ApplicationRecord
    validates :name, presence: true
    validates :cname, presence: true
    validates :email, presence: true, format: { with:/\w+/}
    validates :password, length: {in:8..20}
    # validates :password, presence: true, uniqueness: true <= SQLite3::SQLException: no such column: users.password　エラーが出る
    has_secure_password
    has_many :posts
end
