class AddAttributesToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :skills, :string
    add_column :profiles, :experience, :string
    add_column :profiles, :education, :string
    add_column :profiles, :projects, :string
  end
end
