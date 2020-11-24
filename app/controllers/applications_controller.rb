class ApplicationsController < ApplicationController


  def show
    @note = Note.new
    @appliction = Application.find(params[:id])
    @notes = @application.notes
  end

  def index
    @applications = Application.all
    @statuses = ["Saved", "Applied", "Interviewing", "Offer"]
  end

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
end
