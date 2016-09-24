class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.belongs_to :department, index: true
      t.string :description
      t.timestamps
    end
  end
end
