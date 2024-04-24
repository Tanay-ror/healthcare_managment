class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :document_type

      t.timestamps
    end
  end
end
