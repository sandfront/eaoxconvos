class AddAnonymousToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :anonymous, :boolean, null: false, default:
  end
end
