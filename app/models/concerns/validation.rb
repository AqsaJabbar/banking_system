module Validation
    extend ActiveSupport::Concern
    included do
        validates :reciever_account, presence: true
        validates :amount, presence: true
        validate :check_and_update_balance
        belongs_to :user
        belongs_to :account
    end
    def check_and_update_balance
        receiver = Account.find_by(account_no: self.reciever_account)
        sender = Account.find_by(account_no: self.sender_account)
        if amount.to_i <= (sender.balance).to_i && receiver.present?
           sender.update(balance: (sender.balance).to_i - amount.to_i)
           receiver.update(balance: (receiver.balance).to_i + amount.to_i) 
           return true
        else
          errors[:self] << "Add your validation message here"
          return false 
        end
    end
end