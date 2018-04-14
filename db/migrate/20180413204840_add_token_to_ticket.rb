class AddTokenToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :token_id, :string
    add_column :tickets, :transaction_id, :string
  end
end
