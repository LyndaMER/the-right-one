class AddAuditionDateToAuditions < ActiveRecord::Migration[7.1]
  def change
    add_column :auditions, :date, :date
  end
end
