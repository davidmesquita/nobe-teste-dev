module Transactions
  class DepositController < ApplicationController
    def index
      @transaction = Transaction.new
    end

    def create
      user = User.find(current_user.id)

      transaction = Transaction.new(transaction_params)

      log = TransactionLog.new(user_id: current_user.id, value: transaction.value_transaction.to_d, type_transaction: 'deposit')
  
      # If in error case all changes will be unmade
      User.transaction do
        user.amount += transaction.value_transaction.to_d
        
    
        transaction.save!
        user.save!
        log.save!
  
        redirect_to root_path
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