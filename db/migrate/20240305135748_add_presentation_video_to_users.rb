class AddPresentationVideoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :presentation_video, :string
  end
end
