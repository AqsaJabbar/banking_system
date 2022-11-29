class TransactionsController < ApplicationController
    include TransactionConcern
    def index
        @account=Account.find(params[:account_id])
        @transactions = Transaction.where("sender_account = ? or reciever_account = ?", @account.account_no,@account.account_no)
    end
    def new 
        @transaction=Transaction.new
        @account=Account.find(params[:account_id])
    end
    def create
        @transaction=Transaction.new(transaction_params)
        save_transaction
    end
    def show 
    end
    def destroy
        @transaction.destroy
        redirect_to account_transactions_path(@account)
    end
    private
    def transaction_params
      params.require(:transaction).permit(:sender_account,:reciever_account,:amount,:bank_id,:reciever_title,:user_id,:account_id)
    end
end
