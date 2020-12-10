class Jugyo < ApplicationRecord
  belongs_to :university
  has_many :rooms

  enum day: {
    "日": 0,
    "月": 1,
    "火": 2,
    "水": 3,
    "木": 4,
    "金": 5,
    "土": 6
  }
  
  scope :not_closed, -> { where(is_closed: false) }

end
