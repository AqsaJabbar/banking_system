class Transaction < ApplicationRecord
    belongs_to :user
    validate :check_and_update_balance
    # before_create :check_and_update_balance
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
