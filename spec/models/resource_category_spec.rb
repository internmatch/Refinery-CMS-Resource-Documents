require 'spec_helper'

describe ResourceCategory do

  def reset_resource_category(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @resource_category.destroy! if @resource_category
    @resource_category = ResourceCategory.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_resource_category
  end

  context "validations" do
    
    it "rejects empty title" do
      ResourceCategory.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_resource_category
      ResourceCategory.new(@valid_attributes).should_not be_valid
    end
    
  end

end