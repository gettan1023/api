class UserRoomMessage < ApplicationRecord
  validates :message, presence: true

  belongs_to :room
  belongs_to :user

  before_create :set_send_at
  after_create_commit { MessageBroadcastJob.perform_later self }

  private
    def set_send_at
      self.send_at = Time.zone.now
    end
end
