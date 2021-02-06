class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :job_id
      t.integer :comment_id
      t.integer :application_id

      t.timestamps
    end
  end
end
