class NotesController < ApplicationController
  def create
    @note = Note.new(notes_params)
    @application = Application.find(params[:application_id])
    @note.application = @application
    @note.date = Date.today
    if @note.save
      redirect_to application_path(@application, note: true)
    else
      render "applications/show"
    end
  end

  def edit
    @note = Note.find(params[:id])
    @application = Application.new
  end

  def update
    @note = Note.find(params[:id])
    @note.date = Date.today
    if @note.update(notes_params)

      redirect_to application_path(@note.application)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @application = @note.application
    @note.destroy
    redirect_to application_path(@application, note: true)
  end

  private

  def notes_params
    params.require(:note).permit(:title, :rich_content, :date)
  end
end
