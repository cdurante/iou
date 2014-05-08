class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :debtor_id
      t.string :name
      t.float :amount
      t.boolean :paid

      t.timestamps
    end
    add_index :transactions, :collector_id
    add_index :transactions, :debtor_id
    add_index :transactions, [:collector_id, :debtor_id, :name], unique: true
  end
end
