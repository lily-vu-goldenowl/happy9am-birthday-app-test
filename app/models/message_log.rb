class MessageLog < ApplicationRecord
  belongs_to :user

  validates :message_type, presence: true
  validates :status, presence: true, inclusion: { in: ['sent', 'failed'] }
end
