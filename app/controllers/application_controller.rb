class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :navigation

  def index
    @internal_promotions = InternalPromotionPresenter.new(object: InternalPromotion.where(display: true).order(created_at: :desc), view_template: view_context)
  end

  private

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings

  def navigation
    @header_menu = Optimadmin::Menu.new(name: "header")
    @footer_menu = Optimadmin::Menu.new(name: "footer")
  end
end
