class AccountsController < ApplicationController
    before_action :find_record, only: [:show, :edit,:update,:destroy,:approve]
    def index 
        if current_user.admin?
           @accounts=Account.all
        else
            @accounts=current_user.accounts
        end
    end
    def new 
        @account=Account.new
    end
    def create 
        @account=Account.create(account_params)
        if @account.save
            redirect_to accounts_path 
        else
            render 'new'
        end  
    end
    def show 
    end
    def edit 
    end
    def update 
        if @account.update(account_params)
            redirect_to account_path(@account)
          else
            render 'edit'
          end
    end 
    def destroy
        @account.destroy
        redirect_to accounts_path
    end
    def approve
        @account.update(status: "active")
        redirect_to accounts_path    
      end
    private
    def find_record 
        @account=Account.find(params[:id])
    end
    def account_params
      params.require(:account).permit(:account_no,:title,:account_type,:status,:balance,:user_id,:bank_id)
    end
end
