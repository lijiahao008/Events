class AddCategoriesProfilesTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :categories_profiles, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :profile, index: true
    end
  end
end
