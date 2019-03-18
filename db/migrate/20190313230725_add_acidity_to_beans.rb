class AddAcidityToBeans < ActiveRecord::Migration[5.1]
  def change
    add_column :beans, :acidity, :string
  end
end
