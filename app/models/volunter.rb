# Volunter model
class Volunter < ApplicationRecord
  belongs_to :user
  belongs_to :request
  validates :request_id, presence: true
end
