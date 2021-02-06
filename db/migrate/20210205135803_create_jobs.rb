class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.integer :comment_id
      t.integer :user_id
      t.integer :recruiter_id
      t.integer :application_id

      t.timestamps
    end
  end
end
