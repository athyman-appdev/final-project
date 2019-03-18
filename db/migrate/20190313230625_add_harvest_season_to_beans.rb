class AddHarvestSeasonToBeans < ActiveRecord::Migration[5.1]
  def change
    add_column :beans, :harvest_season, :string
  end
end
