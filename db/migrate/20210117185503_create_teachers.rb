class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false, blank: false
      t.string :lastname, null: false, blank: false
      t.string :email, null: false, blank: false

      t.timestamps
    end
  end
end
