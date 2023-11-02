class Shape < ApplicationRecord
  belongs_to :user
  belongs_to :objective
  belongs_to :resolution
end
