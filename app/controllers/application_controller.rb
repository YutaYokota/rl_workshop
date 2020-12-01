class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :render_html, if: :html_request?

  private

  def render_html
    render 'home/index'
  end

  def html_request?
    request.format.html?
  end
end
