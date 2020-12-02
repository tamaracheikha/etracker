class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
  end

  def create
    @reminder = Reminder.new(reminder_params)
    # @application = Application.find(params[:application_id])
    # @reminder.application = @application
    @reminder.user = current_user
    if @reminder.save
      if request.referrer.split("/").last == "applications"
        redirect_to applications_path(reminder: true)
      else
        redirect_to application_path(@reminder.application)
      end
    else
      render "applications/show"
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    if params[:reminder][:completed]
      @reminder.completed = !@reminder.completed
    end
    @application = @reminder.application
    @reminder.update(reminder_params)
    redirect_to applications_path(reminder: true)
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    redirect_to applications_path(reminder: true)
  end

  private

  def reminder_params
    params.require(:reminder).permit(:title, :description, :scheduled_date, :application_id, :completed, :status)
  end
end
