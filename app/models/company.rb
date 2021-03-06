class Company < ApplicationRecord
  has_many :groups
  has_many :comments, -> { order(:created_at => :desc) },  dependent: :destroy

  validates :name, presence: true, length: {maximum: 100}
  validates :address, presence: true, length: {maximum: 100}
  validates :url, length: {maximum: 100}, format: URI.regexp(['http','https']), allow_blank: true
  validates :tel, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}, allow_blank: true
end
