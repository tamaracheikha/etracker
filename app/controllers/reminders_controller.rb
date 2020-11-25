class RemindersController < ApplicationController
  def index
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @application = Application.find(params[:id])
    @reminder.application = @application
    if @reminder.save
      redirect_to application_path(@application)
    else
      render "applications/show"
    end
  end
end
