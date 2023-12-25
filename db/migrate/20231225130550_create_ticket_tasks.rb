class CreateTicketTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_tasks do |t|
      t.string :title
      t.text :description
      t.references :ticket, null: false, foreign_key: true
      t.timestamps
    end
  end
end
