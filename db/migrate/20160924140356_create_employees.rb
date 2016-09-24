class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.belongs_to :department, index: true
      t.string :name
      t.integer :age
      t.timestamps
    end
  end
end
