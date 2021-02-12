class Comment < ApplicationRecord
    validates :comment_text, presence: true, length: { maximum: 200 }

    belongs_to :user
    belongs_to :job
end
