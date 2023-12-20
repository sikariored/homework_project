class Ticket < ApplicationRecord
  belongs_to :account
  belongs_to :ticket_status
  validates :account_id, presence: true
end
