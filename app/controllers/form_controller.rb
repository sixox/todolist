class FormController < ApplicationController
  def index
        @inquries = Inqury.all
  end
end
