class AddVotesToClassroom < ActiveRecord::Migration[6.1]
  def change
    add_column :classrooms, :votes, :bigint, null: false, default: 0
  end
end
