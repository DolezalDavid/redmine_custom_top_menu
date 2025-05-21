module RedmineCustomTopMenu
  module WelcomeControllerPatch
    def self.included(base)
      base.class_eval do
        # Přepíše metodu index
        def index
          if User.current.logged?
            redirect_to my_page_path
          else
            # Pro nepřihlášené uživatele zachovat původní chování
            @news = News.latest User.current
            @projects = Project.latest User.current
          end
        end
      end
    end
  end
end

# Přidáme patch do controlleru
Rails.application.config.to_prepare do
  WelcomeController.send(:include, RedmineCustomTopMenu::WelcomeControllerPatch)
end
