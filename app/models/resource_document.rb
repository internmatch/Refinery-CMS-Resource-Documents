class ResourceDocument < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :pdf_file, :class_name => 'Resource'
  belongs_to :word_file, :class_name => 'Resource'
  belongs_to :resource_category, :class_name => 'ResourceCategory'
end
