class User < ApplicationRecord
    has_many :contact

    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valide email address" }
end
