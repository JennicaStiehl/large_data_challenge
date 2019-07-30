class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, unique: true
      t.references :sport
    end
  end
end
