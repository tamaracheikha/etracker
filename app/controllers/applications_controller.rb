class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
    @statuses = ["Saved", "Applied", "Interviewing", "Offer"]
  end
end
