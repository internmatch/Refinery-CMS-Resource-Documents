module Admin
  class ResourceDocumentsController < Admin::BaseController

    crudify :resource_document,
            :title_attribute => 'name', :xhr_paging => true

  end
end
