class RemindersController < ApplicationController
  def index
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @application = Application.find(params[:application_id])
    @reminder.application = @application
    @reminder.user = current_user
    if @reminder.save
      redirect_to application_path(@application)
    else
      render "applications/show"
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(:title, :description, :scheduled_date)
  end
end
