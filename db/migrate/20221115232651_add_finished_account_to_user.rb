class AddFinishedAccountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :finished_account, :boolean
  end
end
