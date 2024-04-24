class CreateHealthPolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :health_policies do |t|
      t.string :name
      t.date :expiry_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
