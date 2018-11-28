class NameCard < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { order(:created_at => :desc) },  dependent: :destroy

  validates :name, presence: true, length: {maximum: 100}
 # validates :address, length: {maximum: 100}, presence: true
 # validates :url, length: {maximum: 100, allow: nil}, format: URI.regexp(['http', 'https']), allow_nil: true
 # validates :tel, :fax, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}

  mount_uploader :image, ImageUploader

end
