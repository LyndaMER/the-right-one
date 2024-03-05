class AddAuditionDateToAuditions < ActiveRecord::Migration[7.1]
  def change
    add_column :auditions, :audition_date, :date
  end
end
