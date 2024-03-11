class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :prenom
      t.string :nom
      t.string :mot_de_passe
      t.string :telephone
      t.string :reseau_social
      t.string :adresse
      t.string :ville
      t.string :langues
      t.string :portfolio
      t.string :date_de_naissance

      t.timestamps
    end
  end
end
