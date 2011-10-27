class ResourceCategory < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :audience]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :cover_image, :class_name => 'Image'
  belongs_to :resource_guide, :class_name => 'ResourceGuide'
  has_many :resource_documents, :class_name => 'ResourceDocument'
  
  has_friendly_id :title, :use_slug => true
  
  #
  # Scopes
  #
  #scope :for_audience,  lambda { |a| {:conditions => ["audience = ?", a]} }
  scope :for_audience,  lambda { |a| where(:audience => a) }
  
  
  def documents
    ResourceDocument.where(:resource_category_id => id)
  end
  
  def employer_resource?
    audience =~ /employers/i
  end
  
  def student_resource?
    audience =~ /students/i
  end
end
