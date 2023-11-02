class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :weekly_intention
  belongs_to :shape
end
