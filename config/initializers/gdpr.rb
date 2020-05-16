PolicyManager::Config.setup do |c|
  c.add_rule({name: "cookie", sessionless: true }  )
  # c.add_rule({name: "age", validates_on: [:create, :update], blocking: true })
  c.add_rule({name: "privacy_terms", validates_on: [:create, :update], blocking: true })
  c.logout_url = "/users/sign_out"
  c.from_email = "theo@data-web-univers.com"
  c.admin_email_inbox = "dumez.theo.h@gmail.com"

  c.user_resource = User # defaults to User
  c.admin_user_resource = User # defaults to User
  # is_admin method in order for engine to know
  # how to authorize admin only areas
  c.is_admin_method = ->(o){
    o.admin?
  }
end

# If you are using devise, you must extend engines's controller with devise helpers in order to get current_user
PolicyManager::UserTermsController.send(:include, Devise::Controllers::Helpers)