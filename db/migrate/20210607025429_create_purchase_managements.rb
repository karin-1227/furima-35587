class CreatePurchaseManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_managements do |t|
      t.references :user, null: false, foreigun_key: true
      t.references :item, null: false, foreigun_key: true

      t.timestamps
    end
  end
end
