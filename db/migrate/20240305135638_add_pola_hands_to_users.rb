class AddPolaHandsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pola_mains, :string
  end
end
