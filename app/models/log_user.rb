class LogUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :name, presence: true, length: { maximum: 30 }

  has_many :companies
end
