class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|
      t.float :amount
      t.belongs_to :user

      t.timestamps
    end
  end
end
