class AddDayOfWeek < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :reminder
    add_column :users, :reminder_day_of_week, :string
  end
end
