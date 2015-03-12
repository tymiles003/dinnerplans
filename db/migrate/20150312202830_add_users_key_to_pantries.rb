class AddUsersKeyToPantries < ActiveRecord::Migration
  def change
    add_reference :pantries, :user, index: true
    add_foreign_key :pantries, :users
  end
end
