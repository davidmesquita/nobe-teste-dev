class AddAmountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :amount, :decimal, default: 0
  end
end
