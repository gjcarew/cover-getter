class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
