class CreateTicketTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_types do |t|
      t.string :type_name
      t.timestamps
    end
  end
end
