class Transaction < ApplicationRecord
  include Validation
  belongs_to :user
  belongs_to :account
  scope :sent_recieved_transactions,-> (account){ where("sender_account = ? or reciever_account = ?", account.account_no,account.account_no)}
end
