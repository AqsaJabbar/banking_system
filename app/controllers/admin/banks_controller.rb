module Admin
class BanksController < ApplicationController
    include BankConcern
    def index 
        @banks=Bank.all
    end
    def new 
        @bank=Bank.new
    end
    def create 
        create_bank
    end
    def show 
    end
    def edit 
    end
    def update 
        update_bank
    end 
    def destroy
        @bank.destroy
        redirect_to admin_banks_path
    end
    private
    def bank_params
      params.require(:bank).permit(:title)
    end
end
end