module RedmineCustomTopMenu
  class Hooks < Redmine::Hook::ViewListener
    # Set up the custom menu
    def self.setup_menu
      # Delete the help menu item
      Redmine::MenuManager.map(:top_menu).delete(:help)
      
      # Add new menu items
      Redmine::MenuManager.map(:top_menu) do |menu|
        menu.push :issues, { :controller => 'issues', :action => 'index' }, 
                 :caption => :label_issue_plural, :after => :projects
                 
        menu.push :time_entries, { :controller => 'timelog', :action => 'index' },
                 :if => Proc.new {
                   User.current.allowed_to?(:view_time_entries, nil, :global => true) &&
                   EnabledModule.exists?(:project => Project.visible, :name => :time_tracking)
                 },
                 :caption => :label_spent_time, :after => :issues
      end
    end
  end
end

# Set up the menu on plugin initialization
RedmineCustomTopMenu::Hooks.setup_menu
