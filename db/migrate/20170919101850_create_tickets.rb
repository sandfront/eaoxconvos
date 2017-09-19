class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :taken, null: false, default: false

      t.timestamps
    end
  end
end
