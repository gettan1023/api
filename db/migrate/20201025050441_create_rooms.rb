class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string     :uuid,         null: false
      t.references :jugyo,        null: false, foreign_key: true
      t.boolean    :is_main_room, null: false

      t.timestamps
    end
  end
end
