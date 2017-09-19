class AddAcceptorToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :acceptor_id, :integer, index: true
    add_foreign_key :tickets, :users, column: :acceptor_id
  end
end
