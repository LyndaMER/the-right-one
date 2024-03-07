class ChangeBirthDateToUser < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :birth_date, :string
  end
end
