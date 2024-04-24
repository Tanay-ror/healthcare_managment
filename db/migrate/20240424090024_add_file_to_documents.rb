class AddFileToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :file, :string
  end
end
