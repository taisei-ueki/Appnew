class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string  :name
      t.string  :address
      t.integer :pay_method, default: "0"

      t.timestamps
    end
  end
end
