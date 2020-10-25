class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   :uuid,         null: false
      t.string   :name
      t.datetime :last_used_at

      t.timestamps
    end
  end
end
