class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :date
      t.string :description
      t.string :measure

      t.timestamps
    end
  end
end
