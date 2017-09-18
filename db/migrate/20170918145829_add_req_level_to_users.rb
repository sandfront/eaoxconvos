class AddReqLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :req_level, :integer
  end
end
