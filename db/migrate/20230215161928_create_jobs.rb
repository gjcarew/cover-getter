class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.string :role
      t.string :company
      t.string :description
      t.string :letter_text
    end
  end
end
