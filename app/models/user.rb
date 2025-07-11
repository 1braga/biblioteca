class User < ApplicationRecord
    has_many :readings, dependent: :destroy
    include Nomeavel
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
end
