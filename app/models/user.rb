class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :accounts, dependent: :destroy
  enum role: [
    :user,
    :admin
  ]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
     self.role ||= :user
  end
  def has_account
    if self.accounts
      return true
    else
      return false
    end 
  end
end
