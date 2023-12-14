class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :data
      t.string :value
      t.string :tipo

      t.timestamps
    end
  end
end
