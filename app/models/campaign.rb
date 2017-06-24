class Campaign < ApplicationRecord
  has_and_belongs_to_many :cuepoints
  has_many :results
  
  validates :name, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :limit_start, numericality: { greater_than: 0 , less_than: 10000}
  validates :movie_url,length: {maximum: 50 }
  validate :end_at_must_be_future

  def end_at_must_be_future
    if start_at >= end_at
      errors.add(:end_at, 'error!')
    end
  end 
  
end
