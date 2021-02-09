class Comment < ApplicationRecord
    validates :comment_text, length: { maximum: 200 }

    belongs_to :user
    belongs_to :job
end
