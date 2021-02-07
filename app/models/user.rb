class User < ApplicationRecord
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }

    has_many :comments
    has_many :jobs, through: :comments
    has_many :applications
    has_many :applied_jobs, through: :applications, source: :job

    has_secure_password
end
