# Redmine Custom Top Menu Plugin

A Redmine plugin that redirects the Home page to My Page for logged-in users and customizes the top menu by adding Issues and Time entries items.

## Features
- Redirects Home page to My Page for logged-in users
- Removes the Help menu item
- Adds Issues link to the top menu
- Adds Time entries link to the top menu

## Requirements
- Redmine 6.0.x

## Installation
1. Navigate to your Redmine plugins directory: _cd /var/www/redmine/plugins_
2. Clone the repository: _git clone https://github.com/DolezalDavid/redmine_custom_top_menu.git_
3. Restart Redmine: _sudo systemctl restart apache2_

## Updating
1. Navigate to plugin directory: _cd /var/www/redmine/plugins/redmine_custom_top_menu_
2. Applicate update request: _git pull_
3. Navigate to your Redmine directory: _cd /var/www/redmine_
4. Restart Redmine: _sudo systemctl restart apache2_

## Uninstallation:
1. Navigate to your Redmine plugins directory: _cd /var/www/redmine/plugins_
2. Delete plugin directory: _rm -rf redmine_custom_top_menu_
3. Navigate to your Redmine directory: _cd /var/www/redmine_
4. Restart Redmine: _sudo systemctl restart apache2_

## Languages
- English
- Czech

## License
This plugin is licensed under the MIT license.
