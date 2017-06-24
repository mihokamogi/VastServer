class Cuepoint < ApplicationRecord

  validates :name, presence: true, length: {maximum: 50 }, uniqueness: { case_sensitive: false }
  
  has_and_belongs_to_many :campaigns
  
  has_many :campaigns
  has_many :results
  
end
