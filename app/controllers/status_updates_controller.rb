class StatusUpdatesController < ApplicationController
  def new
    @status_update = StatusUpdate.new
  end

  def create
    @status_update = StatusUpdate.new(status_update_params)
    @application = Application.find(params[:application_id])
    @status_update.application = @application
    @status_update.user = current_user
    if @status_update.save
      redirect_to status_update_path(@status_update)
    else
      render "applications/show"
    end
  end

  def status_update_params
    params.require(:status_update).permit(:content, :date)
  end
end
