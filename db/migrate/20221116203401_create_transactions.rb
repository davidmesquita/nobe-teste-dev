class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :value_transaction
      t.belongs_to :user
      t.string :received_user_id
      t.string :transaction_type

      t.timestamps
    end
  end
end
