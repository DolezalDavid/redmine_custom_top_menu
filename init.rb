require 'redmine'

Redmine::Plugin.register :redmine_custom_top_menu do
  name 'Redmine Custom Top Menu Plugin'
  author 'David Doležal'
  description 'A plugin that redirects Home to My Page for logged-in users and customizes the top menu'
  version '0.1.0'
  url 'https://github.com/DolezalDavid/redmine_custom_top_menu'
  author_url 'https://github.com/DolezalDavid'
end

# Jednodušší a spolehlivější způsob načtení souborů
Rails.application.config.to_prepare do
  # Definujeme cestu k pluginu 
  plugin_dir = File.dirname(__FILE__)
  
  # Načteme soubory z relativních cest v rámci pluginu
  require_dependency "#{plugin_dir}/lib/redmine_custom_top_menu/welcome_controller_patch"
  require_dependency "#{plugin_dir}/lib/redmine_custom_top_menu/hooks"
end
