class Catalog < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true

  
end
