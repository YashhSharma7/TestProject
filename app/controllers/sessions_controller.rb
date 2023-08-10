class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)
    if resource
      if resource.email_verified?
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        # User exists but hasn't confirmed email
        flash.now[:alert] = "Please confirm your email to log in."
        render "new"
      end
    else
      # Invalid login attempt
      flash.now[:alert] = "Invalid email or password."
      self.resource = User.new 
      render "new"
    end
  end
end
