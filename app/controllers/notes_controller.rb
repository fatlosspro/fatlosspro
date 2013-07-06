class NotesController < ApplicationController
  before_action :set_note, only: [:update, :destroy]
  before_filter :authenticate_user!

  def index
    @note = Note.new
    @notes = current_user.notes.paginate(page: params[:page])
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      flash[:notice] = 'Note created'
      redirect_to :user_notes
    else
      flash[:error] = @note.errors.full_messages.join("<br/>").html_safe
      redirect_to :back
    end
  end

  def update
  end

  def destroy
    @note.destroy
    flash[:notice] = 'Note successfully deleted'
    redirect_to :user_notes
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :body, :user_id)
    end
end
