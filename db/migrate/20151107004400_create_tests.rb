class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.text :description
      t.boolean :passing
      t.string :creator

      t.timestamps null: false
    end
  end
end
