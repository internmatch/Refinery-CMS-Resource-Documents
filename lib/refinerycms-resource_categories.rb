require 'refinerycms-base'

module Refinery
  module ResourceCategories
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "resource_categories"
          plugin.activity = {
            :class => ResourceCategory
          }
        end
      end
    end
  end
end
