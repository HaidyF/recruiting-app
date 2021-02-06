class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :job
    has_many :recruiters, through: :jobs
end
