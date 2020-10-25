class CreateJugyos < ActiveRecord::Migration[6.0]
  def change
    create_table :jugyos do |t|
      t.string     :name,         null: false 
      t.references :university,   null: false,                 foreign_key: true
      t.integer    :day
      t.integer    :period
      t.string     :teacher_name
      t.date       :date,         null: false
      t.datetime   :closing_date, null: false
      t.references :admin_user,   null: false,                 foreign_key: { to_table: :users }
      t.boolean    :is_closed,                 default: false

      t.timestamps
    end
  end
end
