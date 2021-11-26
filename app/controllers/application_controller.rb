class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_out_path_for(resource_or_scope)
    puts("-----------")
    puts(resource_or_scope)
    if current_user
      request.referrer
    else
      root_path
    end
  end
end
