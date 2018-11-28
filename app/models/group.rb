class Group < ApplicationRecord
  belongs_to :company
  has_many :users
  has_many :comment_groups, -> { order(:created_at => :desc) },  dependent: :destroy

  validates :name, presence: true, length: {maximum: 100}
end
