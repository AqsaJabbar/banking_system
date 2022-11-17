class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
  before_create :generate_token
  enum type: [
    :current,
    :saving
  ]
  enum status: [
    :active,
    :pending
  ]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
     self.status ||= :pending
  end
  def generate_token
    debugger
    self.account_no=SecureRandom.hex(10)
  end
end
