class CreateTicketAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_assignments do |t|
      t.string :assignment_title
      t.string :assignment_body
      t.string :assignment_from
      t.string :assignment_to

      t.timestamps
    end
  end
end
