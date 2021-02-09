class RemoveRecruiterFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :recruiter, :string
  end
end
