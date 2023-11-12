class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :title
      t.text :content
      t.boolean :opened
      t.string :mask
      t.string :towel
      t.string :fountain
      t.string :locker_room

      t.timestamps
    end
  end
end
