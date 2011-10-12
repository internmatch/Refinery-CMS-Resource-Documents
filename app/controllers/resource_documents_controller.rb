class ResourceDocumentsController < ApplicationController

  before_filter :find_all_resource_documents
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_document in the line below:
    present(@page)
  end

  def show
    @resource_document = ResourceDocument.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resource_document in the line below:
    present(@page)
  end

protected

  def find_all_resource_documents
    @resource_documents = ResourceDocument.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/resource_documents").first
  end

end
