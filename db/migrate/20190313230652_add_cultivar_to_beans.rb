class AddCultivarToBeans < ActiveRecord::Migration[5.1]
  def change
    add_column :beans, :cultivar, :string
  end
end
