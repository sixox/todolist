class ApplicationController < ActionController::Base
  before_action :set_menu_items
  helper_method :contact_for_form

  private

  def contact_for_form
    @contact ||= Contact.new
  end


  def set_menu_items
    @menu_news_3 = Post.where(kind: "news").last(3)
  end
end
