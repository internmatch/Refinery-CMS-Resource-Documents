class ResourceCategoriesController < ApplicationController

  before_filter :find_all_resource_categories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_category in the line below:
    present(@resource_category)
  end

  def show
    @resource_category = ResourceCategory.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_category in the line below:
    present(@resource_category)
  end

protected

  def find_all_resource_categories
    @resource_categories = ResourceCategory.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/resource_categories").first
  end

end