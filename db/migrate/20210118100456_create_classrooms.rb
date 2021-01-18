class CreateClassrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :classrooms do |t|
      t.references :teacher, null: true, foreign_key: true, index: true
      t.references :course, null: true, foreign_key: true, index: true
      t.timestamps
    end
  end
end
