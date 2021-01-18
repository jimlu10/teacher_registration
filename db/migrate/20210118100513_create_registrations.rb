class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.references :classroom, null: false, foreign_key: true, index: true
      t.references :teacher, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
