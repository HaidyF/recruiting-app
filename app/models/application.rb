class Application < ApplicationRecord
    
    validates :title, presence: true
    validates :experience, presence: true
    validates :description, presence: true

    belongs_to :job
    belongs_to :user
end
