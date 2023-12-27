class AddTaskStatusToTicketTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :ticket_tasks, :task_status, foreign_key: { to_table: :task_statuses }, default: 1
  end
end
