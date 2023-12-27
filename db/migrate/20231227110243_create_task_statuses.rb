class CreateTaskStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :task_statuses do |t|
      t.string :task_status_name
      t.timestamps
    end
  end
end
