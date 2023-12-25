class Ticket < ApplicationRecord
  belongs_to :account
  belongs_to :responsible, class_name: 'Account', foreign_key: 'responsible_id', optional: true
  belongs_to :ticket_status
  belongs_to :ticket_type
  validates :account_id, presence: true
  has_many :ticket_tasks, dependent: :destroy
end
