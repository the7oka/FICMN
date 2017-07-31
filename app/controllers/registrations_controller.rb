class RegistrationsController < Devise::RegistrationsController
  def new
    @title = 'Sign Up'
    build_resource({})
    yield resource if block_given?
    respond_with resource
  end
  protected
	def after_sign_up_path_for(resource)
    "/"
  end
end