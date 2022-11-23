class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
  # has_many :transactions, dependent: :destroy
  before_create :generate_token
  enum account_type: [
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
    self.account_no=SecureRandom.hex(2)
  end
end
