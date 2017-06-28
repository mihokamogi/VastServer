class Campaign < ApplicationRecord
 
  has_and_belongs_to_many :cuepoints
  has_many :results

  validates :name, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :limit_start, numericality: { greater_than: 0 , less_than: 10000}
  validates :movie_url,length: {maximum: 100 }
  

  
end
