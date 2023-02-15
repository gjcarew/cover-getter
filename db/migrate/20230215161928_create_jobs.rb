class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.string :role, null: false
      t.string :company, null: false
      t.string :description
      t.string :letter_text
    end
  end
end
