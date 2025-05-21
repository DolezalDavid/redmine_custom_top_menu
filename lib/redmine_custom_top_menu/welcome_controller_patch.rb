# Patch the WelcomeController to redirect Home to My Page for logged-in users
module RedmineCustomTopMenu
  module WelcomeControllerPatch
    def self.included(base)
      base.class_eval do
        # Store the original method
        alias_method :original_index, :index unless method_defined?(:original_index)
        
        # Override the index method
        def index
          if User.current.logged?
            redirect_to my_page_path
          else
            original_index
          end
        end
      end
    end
  end
end

# Apply the patch
unless WelcomeController.included_modules.include?(RedmineCustomTopMenu::WelcomeControllerPatch)
  WelcomeController.send(:include, RedmineCustomTopMenu::WelcomeControllerPatch)
end
