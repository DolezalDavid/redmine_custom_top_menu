Redmine::Plugin.register :redmine_custom_top_menu do
  name 'Redmine Custom Top Menu Plugin'
  author 'David Doležal'
  description 'A plugin that redirects Home to My Page for logged-in users and customizes the top menu'
  version '0.1.0'
  url 'https://github.com/DolezalDavid/redmine_custom_top_menu'
  author_url 'https://github.com/DolezalDavid'
end

# Load custom menu hooks and patches
require_dependency 'redmine_custom_top_menu/hooks'
require_dependency 'redmine_custom_top_menu/welcome_controller_patch'
