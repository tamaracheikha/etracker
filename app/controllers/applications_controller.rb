class ApplicationsController < ApplicationController
  def show
    @user = current_user
    @application = Application.find(params[:id])
    @status_updates = @application.status_updates
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    if @application.save
      StatusUpdate.create(application: @application, date: Date.today, content: @application.application_status)
      redirect_to application_path(@application)
    else
      render :new
    end
  end

  def application_params
    params.require(:application).permit(:company_name, :company_link, :location, :job_title, :job_description, :cv, :cover_letter, :application_status)
  end
end
