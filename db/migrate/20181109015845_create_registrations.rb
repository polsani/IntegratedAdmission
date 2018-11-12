class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.decimal :value
      t.integer :best_day_to_pay
      t.integer :invoice_amount
      t.references :student, foreign_key: true
      t.references :payment_way, foreign_key: true

      t.timestamps
    end
  end
end
