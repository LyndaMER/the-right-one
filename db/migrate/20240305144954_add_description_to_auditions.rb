class AddDescriptionToAuditions < ActiveRecord::Migration[7.1]
  def change
    add_column :auditions, :description, :string
  end
end
