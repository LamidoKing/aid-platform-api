# Request Model
class Request < ApplicationRecord
  belongs_to :user
  has_many :message, class_name: 'Message', foreign_key: 'request', dependent: :destroy
  has_many :volunters, dependent: :destroy

  validates :title, :latitude, :longitude, presence: true

  validates :description, length: {
    maximum: 300, too_long: '%<count>s% characters is the maximum allowed'
  }, presence: true

  validates :status, inclusion: {
    in: %w[Unfulfill Fulfilled],
    message: '%<value>s% is not a valid status type'
  }, presence: true

  validates :type_of_request, inclusion: {
    in: ['One Time Request', 'Material Need'],
    message: '%<value>s% is not a valid request type'
  }, presence: true
end
