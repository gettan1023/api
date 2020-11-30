# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
users = User.create!([{id: 1, uuid: 1, name: "sampleuser1"}, {id: 2, uuid: 2, name: "sampleuser1"}])
jugyo = Jugyo.create!(university_id: 1, name: "samplejugyo", day: "月", period: 1, teacher_name: "teacher_name", date: Date.new(2020, 12, 12), closing_date: DateTime.new(2020, 12, 24, 0, 0, 0), admin_user_id: users.first.id, is_closed: false)
room = Room.create!(id: 1, uuid: 1, jugyo_id: jugyo.id, is_main_room: true)
user_rooms = UserRoom.create!([{room_id: room.id, user_id: users.first.id}, {room_id: room.id, user_id: users.second.id}])
