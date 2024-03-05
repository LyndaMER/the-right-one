class AddPolaFaceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pola_face, :string
  end
end
