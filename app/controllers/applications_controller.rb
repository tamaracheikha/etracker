class ApplicationsController < ApplicationController
  def show
    @user = current_user
    @application = Application.find(params[:id])
    # @status_updates = StatusUpdate.where(application: @user.application)
    @notes = @application.notes
    @note = Note.new
  end

  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    @application.application_status = "Saved"
    if @application.save
      Note.create(application: @application, date: Date.today, )
      redirect_to application_path(@application)
    else
      render :new
    end
  end

  def application_params
    params.require(:application).permit(:company_name, :company_link, :location, :job_title, :job_description, :cv, :cover_letter)
  end
end
