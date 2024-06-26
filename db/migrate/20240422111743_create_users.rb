class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.string :mobile_number
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
