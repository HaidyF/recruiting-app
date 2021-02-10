class User < ApplicationRecord
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }

    has_many :comments, through: :jobs
    has_many :jobs, through: :comments
    has_many :applications
    has_many :applied_jobs, through: :applications, source: :job

    has_secure_password

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(14)
        end
    end

    # def self.admin?
    #     current_user.admin?
    # end
end
