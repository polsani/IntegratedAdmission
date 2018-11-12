class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :value
      t.integer :sequence
      t.date :due_date
      t.references :registration, foreign_key: true
      t.references :payment_way, foreign_key: true

      t.timestamps
    end
  end
end
