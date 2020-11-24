class ApplicationsController < ApplicationController

  def show
    @note = Note.new
    @appliction = Application.find(params[:id])
    @notes = @application.notes
  end
end
