class AddExperienceToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :experience, :integer
  end
end
