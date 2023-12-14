class CreateShoppings < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppings do |t|
      t.string :data
      t.string :value
      t.string :tipo

      t.timestamps
    end
  end
end
