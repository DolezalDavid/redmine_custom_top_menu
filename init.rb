require 'redmine'

Redmine::Plugin.register :redmine_custom_top_menu do
  name 'Redmine Custom Top Menu Plugin'
  author 'David Doležal'
  description 'A plugin that redirects Home to My Page for logged-in users and customizes the top menu'
  version '0.1.0'
  url 'https://github.com/DolezalDavid/redmine_custom_top_menu'
  author_url 'https://github.com/DolezalDavid'
end

# Přidáme debugging výstup do logu
Rails.logger.info("*** Inicializace pluginu Redmine Custom Top Menu ***")

# Načtení souborů s naším kódem
require File.expand_path('../lib/redmine_custom_top_menu/welcome_controller_patch', __FILE__)
require File.expand_path('../lib/redmine_custom_top_menu/menu_manager_patch', __FILE__)

# Registrace funkcí, které se mají spustit při každém HTTP požadavku
Rails.application.config.after_initialize do
  Rails.logger.info("*** Aplikování Custom Top Menu patchů ***")
  RedmineCustomTopMenu::WelcomeControllerPatch.apply
  RedmineCustomTopMenu::MenuManagerPatch.apply
end
