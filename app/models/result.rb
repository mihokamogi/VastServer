class Result < ApplicationRecord
  validates :count_start, numericality: { greater_than_or_equal_to: 0 }
  validates :count_end, numericality: { greater_than_or_equal_to: 0 }
  
  belongs_to :cuepoint 
  belongs_to :campaign 
end
