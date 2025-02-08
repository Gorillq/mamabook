class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def index
  end
  protect_from_forgery with: :exception

  protected
  def handle_unverified_request
     redirect_to warn_path
   end
end
