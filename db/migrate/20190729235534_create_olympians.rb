class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string :name
      t.references :team
      t.integer :age
      t.float :weight
      t.float :height
      t.string :gender
      t.references :sport
      t.timestamps
    end
  end
end
