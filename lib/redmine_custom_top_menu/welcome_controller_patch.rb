module RedmineCustomTopMenu
  module WelcomeControllerPatch
    def self.included(base)
      base.class_eval do
        # Override the index method to redirect to My Page for logged-in users
        def index
          # Redirect to My Page for logged-in users
          if User.current.logged?
            redirect_to my_page_path
          else
            # Original behavior for anonymous users
            @news = News.latest User.current
            @projects = Project.latest User.current
          end
        end
      end
    end
  end
end

# Apply the patch
Rails.configuration.to_prepare do
  WelcomeController.send(:include, RedmineCustomTopMenu::WelcomeControllerPatch)
end
