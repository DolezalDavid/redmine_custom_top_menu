module RedmineCustomTopMenu
  class Hooks < Redmine::Hook::ViewListener
    def self.custom_top_menu
      # Remove Help menu item
      Redmine::MenuManager.map(:top_menu).delete(:help)
      
      # Add new menu items
      Redmine::MenuManager.map(:top_menu) do |menu|
        # Add Issues menu item after Projects
        menu.push :issues, { :controller => 'issues', :action => 'index' }, 
                 :caption => :label_issue_plural, :after => :projects
                 
        # Add Time entries menu item after Issues
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

# Register menu modifications at startup
Rails.configuration.to_prepare do
  RedmineCustomTopMenu::Hooks.custom_top_menu
end
