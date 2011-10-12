class CreateResourceCategories < ActiveRecord::Migration

  def self.up
    create_table :resource_categories do |t|
      t.string :title
      t.string :audience
      t.integer :cover_image_id
      t.integer :position

      t.timestamps
    end

    add_index :resource_categories, :id

    load(Rails.root.join('db', 'seeds', 'resource_categories.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "resource_categories"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/resource_categories"})
    end

    drop_table :resource_categories
  end

end
