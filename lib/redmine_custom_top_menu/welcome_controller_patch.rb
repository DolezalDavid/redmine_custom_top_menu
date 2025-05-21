module RedmineCustomTopMenu
  module WelcomeControllerPatch
    def self.apply
      Rails.logger.info("*** Aplikování WelcomeController patche ***")
      
      # Ujistíme se, že patch ještě nebyl aplikován
      unless WelcomeController.included_modules.include?(self)
        WelcomeController.prepend(self)
        Rails.logger.info("*** WelcomeController patch úspěšně aplikován ***")
      end
    end
    
    # Přepsání metody index
    def index
      Rails.logger.info("*** WelcomeController#index volán pro uživatele: #{User.current.logged? ? User.current.login : 'anonymous'} ***")
      
      if User.current.logged?
        Rails.logger.info("*** Přesměrování na My Page ***")
        redirect_to my_page_path
      else
        Rails.logger.info("*** Zobrazení výchozí Home page ***")
        super
      end
    end
  end
end
