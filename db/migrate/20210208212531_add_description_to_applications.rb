class AddDescriptionToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :description, :string
  end
end
