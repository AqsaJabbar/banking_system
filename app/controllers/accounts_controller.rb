class AccountsController < ApplicationController
    include AccountsConcern
     def index 
        all_accounts
    end
    def new 
        @account=Account.new
    end
    def create 
        create_account
    end
    def show 
    end
    def edit 
    end
    def update 
        update_account
    end 
    def destroy
        @account.destroy
        redirect_to accounts_path
    end
    private
    def account_params
      params.require(:account).permit(:account_no,:title,:account_type,:status,:balance,:user_id,:bank_id)
    end
end
