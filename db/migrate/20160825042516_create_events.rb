class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :time
      t.string :location
      t.integer :profile_id

      t.timestamps
    end
  end
end
