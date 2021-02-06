class User < ApplicationRecord
    has_many :comments
    has_many :jobs, through: :comments
    has_many :applications
    has_many :applied_jobs, through: :applications, source: :job

    has_secure_password
end
