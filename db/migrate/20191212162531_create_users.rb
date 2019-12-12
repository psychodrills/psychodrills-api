class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :confirmation_token
      t.string :confirmed_at
      t.string :locked
      t.string :is_deleted

      t.timestamps
    end
  end
end
