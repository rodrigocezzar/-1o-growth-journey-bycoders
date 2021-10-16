class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.boolean :admin
      t.string :email

      t.timestamps
    end
  end
end
