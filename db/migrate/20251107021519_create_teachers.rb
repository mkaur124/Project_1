class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.references :school, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :subject
      t.string :email

      t.timestamps
    end
  end
end
