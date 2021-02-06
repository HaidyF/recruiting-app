class CreateRecruiters < ActiveRecord::Migration[6.1]
  def change
    create_table :recruiters do |t|
      t.string :title
      t.string :description
      t.string :job_field
      t.integer :job_id

      t.timestamps
    end
  end
end
