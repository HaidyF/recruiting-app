class RemoveJobIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :job_id, :integer
  end
end
