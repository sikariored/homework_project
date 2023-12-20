class AddAccountIdToTickets < ActiveRecord::Migration[7.1]
  def change
    add_reference :tickets, :account, null: false, foreign_key: true
  end
end
