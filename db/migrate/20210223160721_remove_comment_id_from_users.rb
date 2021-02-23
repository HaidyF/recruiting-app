class RemoveCommentIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :comment_id, :integer
  end
end
