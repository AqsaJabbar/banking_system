class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :sender_account
      t.string :reciever_account
      t.string :amount

      t.timestamps
    end
  end
end
