class ApplicationController < ActionController::Base
  helper_method :contact_for_form

  private

  def contact_for_form
    @contact ||= Contact.new
  end
end
