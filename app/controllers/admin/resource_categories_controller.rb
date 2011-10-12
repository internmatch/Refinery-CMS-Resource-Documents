module Admin
  class ResourceCategoriesController < Admin::BaseController

    crudify :resource_category, :xhr_paging => true

  end
end
