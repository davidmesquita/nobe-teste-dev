class TransactionsController < ApplicationController
  def index
    @transaction = Transaction.new
  end

  def deposit
    user = User.find(params[:transaction][:received_user_id])

    transaction = Transaction.new(transaction_params)

    # If in error case all changes will be unmade
    User.transaction do
      user.amount += transaction.value_transaction.to_d
  
      transaction.save!
      user.save!

      redirect_to root_path
    end
  end

  

  private

  def transaction_params
    params.require(:transaction).permit(:value_transaction, :received_user_id).merge(user: current_user)
  end
end
