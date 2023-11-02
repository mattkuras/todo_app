class Objective < ApplicationRecord
  belongs_to :user
  belongs_to :resolution
  belongs_to :goal
end
