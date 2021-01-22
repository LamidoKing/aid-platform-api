# User Model
class User < ApplicationRecord
  has_secure_password
  has_one_attached :govnt_id
  has_many :requests, dependent: :destroy
  has_many :sender, class_name: 'Message', foreign_key: 'sender', dependent: :destroy
  has_many :receiver, class_name: 'Message', foreign_key: 'receiver', dependent: :destroy
  has_many :messages, class_name: 'Message', foreign_key: 'sender', dependent: :destroy
  has_many :messages, class_name: 'Message', foreign_key: 'receiver', dependent: :destroy
  has_many :volunters, dependent: :destroy
  validates :govnt_id, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'application/pdf'] } unless :govnt_id.present?
  validates :first_name, :last_name, presence: true
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true

  before_save { self.email = email.downcase }
end
