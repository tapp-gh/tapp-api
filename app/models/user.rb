class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :date_of_birth, presence: true
    has_secure_password
end
