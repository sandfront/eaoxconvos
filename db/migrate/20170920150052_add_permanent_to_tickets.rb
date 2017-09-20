class AddPermanentToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :permanent, :boolean,  null: false, default: false
  end
end
