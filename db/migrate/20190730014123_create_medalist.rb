class CreateMedalist < ActiveRecord::Migration[5.2]
  def change
    create_table :medalists do |t|
      t.references :medal
      t.references :olympian
      t.references :event
      t.references :game

    end
  end
end
