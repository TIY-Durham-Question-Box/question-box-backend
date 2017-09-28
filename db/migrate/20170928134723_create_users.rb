class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, unique: true, null: false
      t.string :email, unique: true
      t.string :password_digest, null: false
      t.string :token

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
