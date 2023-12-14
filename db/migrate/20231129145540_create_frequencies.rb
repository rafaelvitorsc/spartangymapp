class CreateFrequencies < ActiveRecord::Migration[7.0]
  def change
    create_table :frequencies do |t|
      t.string :data
      t.string :turno
      t.string :treino

      t.timestamps
    end
  end
end
