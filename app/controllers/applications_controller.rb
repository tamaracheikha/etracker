class ApplicationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :extension

  def show
    @user = current_user
    @application = Application.find(params[:id])
    @status_updates = @application.status_updates
    @notes = @application.notes
    @note = Note.new
    @reminder = Reminder.new
  end

  def index
    @applications = current_user.applications
    @reminders = current_user.reminders
    @reminder = Reminder.new
    @application = Application.new
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to application_path(@application), notice: 'Application was successfully updated.' }
        format.json {}
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

    # @application = Application.find(params[:id])
    # if @application.update(application_params)
    #   redirect_to application_path(@application)
    # else
    #   render :edit
    # end


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

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    redirect_to applications_path
  end

  def extension
    byebug
  end

  private

  def application_params
    params.require(:application).permit(:company_name, :company_link, :location, :job_title, :job_description, :cv, :cover_letter, :application_status)
  end
end
