class AddVotesToTeacher < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :votes, :bigint, null: false, default: 0
  end
end
