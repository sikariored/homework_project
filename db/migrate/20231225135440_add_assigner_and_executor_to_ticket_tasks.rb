class AddAssignerAndExecutorToTicketTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :ticket_tasks, :assigner, foreign_key: { to_table: :accounts }
    add_reference :ticket_tasks, :executor, foreign_key: { to_table: :accounts }
  end
end
