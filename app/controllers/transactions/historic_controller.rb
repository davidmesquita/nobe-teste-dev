module Transactions
  class HistoricController < ApplicationController
    def index
      initial_date_range = params[:initial_date]
      final_date_range   = params[:final_date]

      # Pegar os transactions logs inves de transactions
      @transaction_logs = TransactionLog.where(created_at: initial_date_range...final_date_range)
                                        .where(user_id: current_user.id)
    end
  end
end
