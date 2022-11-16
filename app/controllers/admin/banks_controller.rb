module Admin
class BanksController < ApplicationController
    before_action :find_record, only: [:show, :edit,:update,:destroy]
    def index 
        @banks=Bank.all
    end
    def new 
        @bank=Bank.new
    end
    def create 
        @bank=Bank.create(bank_params)
        if @bank.save
            redirect_to admin_banks_path 
        else
            render 'new'
        end  
    end
    def show 
    end
    def edit 
    end
    def update 
        if @bank.update(bank_params)
            redirect_to admin_bank_path(@bank)
          else
            render 'edit'
          end
    end 
    def destroy
        @bank.destroy
        redirect_to admin_banks_path
    end
    private
    def find_record 
        @bank=Bank.find(params[:id])
    end
    def bank_params
      params.require(:bank).permit(:title)
    end
end
end