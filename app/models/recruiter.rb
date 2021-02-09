class Recruiter < ApplicationRecord
    validates :title, presence: true
    
    has_many :jobs
end
