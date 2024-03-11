class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :phone_number
      t.string :social_link
      t.string :address
      t.string :city
      t.string :languages
      t.string :portfolio
      t.string :birth_date

      t.timestamps
    end
  end
end
