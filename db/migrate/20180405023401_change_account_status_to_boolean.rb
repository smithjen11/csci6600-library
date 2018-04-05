class ChangeAccountStatusToBoolean < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :account_status
  	add_column :users, :account_status, :boolean, default: true
  end
end
