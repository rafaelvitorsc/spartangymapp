class AddNameToTrainings < ActiveRecord::Migration[7.0]
  def change
    add_column :trainings, :name, :string
  end
end
