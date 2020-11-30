class User < ApplicationRecord
  has_many :user_room_messages
  has_many :rooms, through: :user_rooms

  before_create :set_uuid

  private
    def set_uuid
      self.uuid = SecureRandom.uuid
    end
end
