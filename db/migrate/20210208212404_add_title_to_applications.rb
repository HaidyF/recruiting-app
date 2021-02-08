class AddTitleToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :title, :string
  end
end
