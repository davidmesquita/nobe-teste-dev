module Transactions
  class WithdrawController < ApplicationController
    def index
      @transaction = Transaction.new
    end

    def create
      user = User.find(current_user.id)

      transaction = Transaction.new(transaction_params)
      
      # If in error case all changes will be unmade
      User.transaction do
        user.amount -= transaction.value_transaction.to_d
        if transaction.value_transaction.to_d > user.amount
          puts "saldo insuficiente"
        else
          log_withdraw = TransactionLog.new(user_id: current_user.id, value: transaction.value_transaction.to_d, type_transaction: 'withdraw')
          log_withdraw.save!
          transaction.save!
          user.save!
    
          redirect_to root_path
        end
      end
    end

    private

    def transaction_params
      params.require(:transaction)
            .permit(:value_transaction)
            .merge(user: current_user, received_user_id: current_user.id)
    end
  end
end