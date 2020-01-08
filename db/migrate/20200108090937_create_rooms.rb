class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :workspace, null: false, foreign_key: true
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
