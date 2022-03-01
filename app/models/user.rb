class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :date_of_birth, presence: true
    validates :password_digest, presence: true
    has_secure_password
    
    scope :active, -> { where(is_active: true).order(:name) }
end
