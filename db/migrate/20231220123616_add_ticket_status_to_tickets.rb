class AddTicketStatusToTickets < ActiveRecord::Migration[7.1]
  def change
    add_reference :tickets, :ticket_status, null: false, foreign_key: true, default: 1
  end
end
