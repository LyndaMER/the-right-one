class AddPola34ToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pola_3_4, :string
  end
end
