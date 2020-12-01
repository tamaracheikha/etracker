class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if reminder_params.include?("application_id")
      @application = Application.find(reminder_params[:application_id])
      @reminder.application = @application
      @reminder.user = current_user
      if @reminder.save
        redirect_to application_path(@application)
      else
        render "applications/show"
      end
    else
      @application = Application.find(params[:application_id])
      @reminder.application = @application
      @reminder.user = current_user
      if @reminder.save
        redirect_to applications_path(reminder: true)
      else
        render "applications/show"
      end
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
