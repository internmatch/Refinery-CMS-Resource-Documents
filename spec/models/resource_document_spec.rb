require 'spec_helper'

describe ResourceDocument do

  def reset_resource_document(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @resource_document.destroy! if @resource_document
    @resource_document = ResourceDocument.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_resource_document
  end

  context "validations" do
    
    it "rejects empty name" do
      ResourceDocument.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_resource_document
      ResourceDocument.new(@valid_attributes).should_not be_valid
    end
    
  end

end