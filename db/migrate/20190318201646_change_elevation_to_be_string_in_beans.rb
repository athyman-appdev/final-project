class ChangeElevationToBeStringInBeans < ActiveRecord::Migration[5.1]
  def change
    change_column :beans, :elevation, :string
  end
end
