class AddPolaHandsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pola_hands, :string
  end
end
