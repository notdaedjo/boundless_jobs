class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :position
      t.text :description
      t.integer :level
      t.text :skills

      t.timestamps
    end
  end
end
