class RemoveApplicationIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :application_id, :integer
  end
end
