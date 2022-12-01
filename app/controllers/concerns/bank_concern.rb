module BankConcern
    extend ActiveSupport::Concern
    included do
        before_action :find_record, only: [:show, :edit,:update,:destroy]    
    end
    def create_bank 
        @bank=Bank.create(bank_params)
        if @bank.save
            redirect_to admin_banks_path 
        else
            render 'new'
        end  
    end
    def update_bank
        if @bank.update(bank_params)
            redirect_to admin_bank_path(@bank)
          else
            render 'edit'
          end
    end
    def sub
        @account=Bank.find(params[:id]).accounts 
    end 
    def find_record 
        @bank=Bank.find(params[:id])
    end
end