class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_new_application

  private

  def set_new_application
    @new_application = Application.new
  end
end
