class ResourceCategory < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :audience]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :cover_image, :class_name => 'Image'
  belongs_to :resource_guide, :class_name => 'ResourceGuide'
  
  has_friendly_id :title, :use_slug => true
  
  def documents
    ResourceDocument.where(:resource_category_id => id)
  end
end
