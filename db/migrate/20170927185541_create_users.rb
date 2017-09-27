class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :timestamps, :datetime

  end
end
