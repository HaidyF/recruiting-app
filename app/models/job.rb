class Job < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    has_many :comments
    has_many :users, through: :comments
    has_many :applications
    has_many :applicants, through: :applications, source: :user

    scope :ordered_by_title, -> { order(title: :asc) }

    end
