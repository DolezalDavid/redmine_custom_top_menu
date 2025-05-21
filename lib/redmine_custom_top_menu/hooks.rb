module RedmineCustomTopMenu
  class Hooks
    # Nastavení vlastního menu
    def self.apply
      # Odstranění help položky menu
      Redmine::MenuManager.map(:top_menu).delete(:help)
      
      # Přidání nových položek menu
      Redmine::MenuManager.map(:top_menu) do |menu|
        # Přidání issues
        menu.push :issues, { :controller => 'issues', :action => 'index' }, 
                 :caption => :label_issue_plural, :after => :projects
                 
        # Přidání time entries
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

# Aplikujeme úpravy menu při inicializaci
Rails.application.config.to_prepare do
  RedmineCustomTopMenu::Hooks.apply
end
