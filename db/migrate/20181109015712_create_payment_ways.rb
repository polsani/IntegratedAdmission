class CreatePaymentWays < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_ways do |t|
      t.string :description

      t.timestamps
    end
  end
end
