require 'refinerycms-base'

module Refinery
  module ResourceDocuments
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "resource_documents"
          plugin.activity = {
            :class => ResourceDocument,
            :title => 'name'
          }
        end
      end
    end
  end
end
require File.expand_path('../refinerycms-resource_categories', __FILE__)