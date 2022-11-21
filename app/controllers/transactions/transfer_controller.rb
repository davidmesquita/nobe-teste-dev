module Transactions
  class TransferController < ApplicationController
    def index
      @transaction = Transaction.new
    end

    def create
      #procurando o usuario
      user = User.find(current_user.id)

      #procurando o usuario que vai recerber a transferencaia
      received_user = User.find(params[:transaction][:received_user_id])

      #criando a transferencia
      transaction = Transaction.new(transaction_params)


      #atribuindo o valor da transferencia pra variavel
      transaction_value = transaction.value_transaction.to_d
      
      #criando o log da transferencia com o id sendo o id do usuario
      log_user = TransactionLog.new(user_id: user.id, value: transaction.value_transaction.to_d, type_transaction: 'transfer')

      #criando o log da transferencia com o id do usuario que vai receber
      log_received = TransactionLog.new(user_id: received_user.id, value: transaction.value_transaction.to_d, type_transaction: 'received transfer')

      # If in error case all changes will be unmade
      User.transaction do
        if transaction.value_transaction.to_d > user.amount
          puts "saldo insuficiente"
        else
          user.amount          -= transaction_value
          received_user.amount += transaction_value

          #salvando a transferencia 
          transaction.save!
          received_user.save!
          user.save!
          log_user.save!
          log_received.save!
    
          redirect_to root_path
        end
      end
    end

    private

    def transaction_params
      params.require(:transaction)
            .permit(:value_transaction, :received_user_id)
            .merge(user: current_user)
    end
  end
end
