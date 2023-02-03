class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.string :price
      

      t.timestamps
    end
  end
end
