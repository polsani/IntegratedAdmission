class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :tax_id
      t.integer :grade_enem

      t.timestamps
    end
  end
end
