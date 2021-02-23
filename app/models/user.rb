class User < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :comments
    has_many :jobs, through: :comments
    has_many :applications
    has_many :applied_jobs, through: :applications, source: :job

    has_secure_password
    

    def self.create_from_omniauth(auth)
            User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['id_info']['name']
            u.email = auth['id_info']['email']
            u.password = SecureRandom.hex(10)
        
        end
    end

end
