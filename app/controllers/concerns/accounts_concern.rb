module AccountsConcern
    extend ActiveSupport::Concern
    included do
        before_action :find_record, only: [:show, :edit,:update,:destroy,:approve]
    end
    def approve
        @account.update(status: "active")
        redirect_to accounts_path    
    end
    def find_reciever
        @rec_name=Account.find_by(account_no: params[:id])
    end
    def find_record 
        @account=Account.find(params[:id])
    end
    def create_account 
        @account=Account.create(account_params)
        if @account.save
            redirect_to accounts_path 
        else
            render 'new'
        end  
    end
    def all_accounts
        if current_user.admin?
            #    @accounts=Account.rich.all
            @accounts=Account.all
        else
            @accounts=current_user.accounts
        end 
    end
    def update_account 
        if @account.update(account_params)
            redirect_to account_path(@account)
        else
            render 'edit'
        end
    end
end