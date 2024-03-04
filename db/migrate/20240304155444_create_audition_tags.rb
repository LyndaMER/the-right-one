class CreateAuditionTags < ActiveRecord::Migration[7.1]
  def change
    create_table :audition_tags do |t|
      t.references :audition, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.boolean :required

      t.timestamps
    end
  end
end
