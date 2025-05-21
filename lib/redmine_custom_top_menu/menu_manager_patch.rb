module RedmineCustomTopMenu
  module MenuManagerPatch
    def self.apply
      Rails.logger.info("*** Aplikování úprav menu ***")
      
      # Odstraníme položku Help
      Redmine::MenuManager.map(:top_menu).delete(:help)
      Rails.logger.info("*** Položka Help odstraněna z menu ***")
      
      # Přidáme položky Issues a Time entries
      Redmine::MenuManager.map(:top_menu) do |menu|
        # Přidání Issues
        menu.push :issues, { :controller => 'issues', :action => 'index' },
                :caption => :label_issue_plural, :after => :projects
        Rails.logger.info("*** Položka Issues přidána do menu ***")
        
        # Přidání Time entries
        menu.push :time_entries, { :controller => 'timelog', :action => 'index' },
                :if => Proc.new {
                  User.current.allowed_to?(:view_time_entries, nil, :global => true) &&
                  EnabledModule.exists?(:project => Project.visible, :name => :time_tracking)
                },
                :caption => :label_spent_time, :after => :issues
        Rails.logger.info("*** Položka Time entries přidána do menu ***")
      end
    end
  end
end
