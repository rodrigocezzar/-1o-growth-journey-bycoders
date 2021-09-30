class CreateNegociationValues < ActiveRecord::Migration[6.1]
  def change
    create_table :negociation_values do |t|
      t.decimal :max_value, default: 0.0
      t.decimal :min_value, default: 0.0
      t.decimal :comission, default: 0.0

      t.timestamps
    end
  end
end
