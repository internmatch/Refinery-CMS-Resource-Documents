class CreateResourceDocuments < ActiveRecord::Migration

  def self.up
    create_table :resource_documents do |t|
      t.string :name
      t.integer :pdf_file_id
      t.integer :word_file_id
      t.integer :position

      t.timestamps
    end

    add_index :resource_documents, :id

    load(Rails.root.join('db', 'seeds', 'resource_documents.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "resource_documents"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/resource_documents"})
    end

    drop_table :resource_documents
  end

end
