class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.references :teacher, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :grade_level
      t.string :email

      t.timestamps
    end
  end
end
