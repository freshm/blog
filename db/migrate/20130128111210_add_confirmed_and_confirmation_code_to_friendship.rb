class AddConfirmedAndConfirmationCodeToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :confirmed, :boolean, default: false
    add_column :friendships, :confirmation_code, :string
  end
end
