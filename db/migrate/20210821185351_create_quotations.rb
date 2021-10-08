class CreateQuotations < ActiveRecord::Migration[6.1]
  def change
    create_table :quotations do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :status
      t.decimal :value, default: 0.0
      t.decimal :cost_index, default: 0.0
      t.decimal :factory_cost, default: 0.0
      t.string :form_payment
      t.decimal :minimal_sale_value, default: 0.0
      t.decimal :reserve_cost, default: 0.0
      t.decimal :credit_card_fee, default: 0.0
      t.integer :installments
      t.decimal :net_value, default: 0.0
      t.decimal :discount, default: 0.0
      t.decimal :tax, default: 0.0
      t.decimal :manager_commission, default: 0.0
      t.decimal :assembler_commission, default: 0.0
      t.decimal :seller_commission, default: 0.0
      t.decimal :finder_commission, default: 0.0
      t.decimal :shipping_cost, default: 0.0
      t.decimal :minimal_percent, default: 0.0
      t.decimal :result, default: 0.0      
      t.decimal :suggested_price_manufactures, default: 0.0
      
      

      t.timestamps
    end
  end
end
