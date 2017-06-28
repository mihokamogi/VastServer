class CreateCampaignsCuepoints < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns_cuepoints, id: false do |t|
      t.references :campaign, index: true, null: false
      t.references :cuepoint, index: true, null: false
    end
  end
end
