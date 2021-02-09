class AddRecruiterToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :recruiter, :string
  end
end
