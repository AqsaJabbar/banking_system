class TransactionsController < ApplicationController
    before_action :find_record, only: [:show, :edit,:update,:destroy]
    def index
        @account=Account.find(params[:account_id]) 
        @transactions=Transaction.all
    end
    def new 
        @transaction=Transaction.new
        @account=Account.find(params[:account_id])
    end
    def create 
        @transaction=Transaction.new(transaction_params)
        if @transaction.save
            redirect_to account_transactions_path 
        else
            render 'new'
        end  
    end
    def show 
    end
    def edit 
    end
    def update 
        if @transaction.update(transaction_params)
            redirect_to account_transaction_path(@account.id,@transaction)
          else
            render 'edit'
          end
    end 
    def destroy

        @transaction.destroy
        redirect_to account_transactions_path(@account)
    end
    private
    def find_record 
        @transaction=Transaction.find(params[:id])
        @account=Account.find(params[:account_id])
    end
    def find_account 
        @account=Account.find(params[:account_id])
    end
    def transaction_params
      params.require(:transaction).permit(:sender_account,:reciever_account,:amount,:bank_id)
    end
end
