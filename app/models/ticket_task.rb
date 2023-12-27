class TicketTask < ApplicationRecord
  belongs_to :ticket
  belongs_to :task_status
end
