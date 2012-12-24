class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
			t.integer :user_id
			t.string :semester
			t.string :year

      t.timestamps
    end
  end
end
