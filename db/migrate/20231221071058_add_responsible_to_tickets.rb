class AddResponsibleToTickets < ActiveRecord::Migration[7.1]
  def change
    add_reference :tickets, :responsible, foreign_key: { to_table: :accounts }
  end
end
