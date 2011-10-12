module NavigationHelpers
  module Refinery
    module ResourceDocuments
      def path_to(page_name)
        case page_name
        when /the list of resource_documents/
          admin_resource_documents_path

         when /the new resource_document form/
          new_admin_resource_document_path
        when /the list of resource_categories/
          admin_resource_categories_path

         when /the new resource_category form/
          new_admin_resource_category_path
        else
          nil
        end
      end
    end
  end
end
