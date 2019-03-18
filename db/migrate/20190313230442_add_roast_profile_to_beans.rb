class AddRoastProfileToBeans < ActiveRecord::Migration[5.1]
  def change
    add_column :beans, :roast_profile, :string
  end
end
