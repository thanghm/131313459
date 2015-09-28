RailsAdmin.config do |config|

   config.authenticate_with do
     authenticate_admin!
   end
   config.current_user_method(&:current_admin)
   config.authorize_with :cancan
  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  config.main_app_name = ["Vnwork app", "Admin"]
  #config.main_app_name = Proc.new { |controller| [ "Vnwork app", "Admins - #{controller.params[:action].try(:titleize)}" ] }
 

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
