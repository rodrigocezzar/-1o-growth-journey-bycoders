class CreateSetups < ActiveRecord::Migration[6.1]
  def change
    create_table :setups do |t|      
      t.decimal :manager_commission, default: 0.0
      t.decimal :assembler_commission, default: 0.0
      t.decimal :factory_cost, default: 0.0
      t.decimal :seller_commission, default: 0.0
      t.decimal :credit_card_fee, default: 0.0
      t.decimal :shipping_cost, default: 0.0
      t.decimal :finder_commission, default: 0.0
      t.decimal :reserve_cost, default: 0.0
      t.decimal :tax, default: 0.0
      t.decimal :negotiated_value, default: 0.0
      t.decimal :discount, default: 0.0

      t.timestamps
    end
  end
end
