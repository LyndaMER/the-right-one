class AddPolaSilhouetteToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pola_silhouette, :string
  end
end
