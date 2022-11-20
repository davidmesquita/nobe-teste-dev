class TransactionsLog < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_logs do |t|
      t.integer :user_id
      t.string :type_transaction
      t.decimal :value

      t.timestamps
    end
  end
end
