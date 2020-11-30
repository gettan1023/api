class CreateUserRoomMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_room_messages do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text       :message
      t.string     :image
      t.datetime   :send_at

      t.timestamps
    end
  end
end
