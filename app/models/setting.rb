class Setting < ApplicationRecord
  VALID_HEX_COLOR_REGEX = /\A#([A-Fa-f0-9]{6})\z/

  validates :navbar_color, presence: true, length: { is: 7 }, format: { with: VALID_HEX_COLOR_REGEX }

  belongs_to :user
end
