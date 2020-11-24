class ApplicationsController < ApplicationController
  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    if @application.save
      redirect_to_application_path(@application)
    else
      render :new
    end
  end

  def application_params
    params.require(:application).permit(:company_name, :company_link, :location, :job_title, :job_description, :cv, :cover_letter)
  end

  def show
    @application = Application.find(params[:id])
  end
end
