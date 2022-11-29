module TransactionConcern
    extend ActiveSupport::Concern
    included do
        before_action :find_record, only: [:show,:destroy]
        before_action :find_account, only: [:create]
    end
    def save_transaction
        if @transaction.save
            redirect_to account_transactions_path 
        else
            flash.alert="Unsuccessfull transaction"
            redirect_to accounts_path
        end  
    end
    def find_record 
        @transaction=Transaction.find(params[:id])
        @account=Account.find(params[:account_id])
    end
    def find_account 
        @account=Account.find(params[:account_id])
    end
end