class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :principal_name
      t.integer :founded_year

      t.timestamps
    end
  end
end
