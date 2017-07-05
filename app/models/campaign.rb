class Campaign < ApplicationRecord
 
  has_and_belongs_to_many :cuepoints
  has_many :results, :dependent => :destroy

  validates :name, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :limit_start, numericality: { greater_than: 0 , less_than: 10000}
  validates :movie_url,length: { minimum:5, maximum: 100 }
  validates_datetime :end_at, :after => :start_at 

  def self.current_available(cuepoint)
      campaigns = cuepoint.campaigns.where("start_at <= '#{Time.now}' AND end_at >= '#{Time.now}'").to_a
      campaigns.delete_if do |campaign|
          result = Result.where(campaign: campaign, cuepoint: @cuepoint).first
          !result.blank? && result.count_start >= campaign.limit_start 
      end
  end
  
end
