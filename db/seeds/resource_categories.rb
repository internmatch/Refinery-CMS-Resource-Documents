if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'resource_categories').blank?
      user.plugins.create(:name => 'resource_categories',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Resource Categories',
    :link_url => '/resource_categories',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/resource_categories(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end