class NotesController < ApplicationController
  private
  # Méthode accèdant aux champs du formulaire de création
  def notes_params
    params.require(:note).permit(:titre, :contenu, :cabinet_id)
  end


  public
  def index
    @notes = Note.all()
  end

  # Méthode affichant une seule note
  def show
    
  end

  # Méthode affichant un formulaire pour la création d'une nouvelle instance de la classe Note
  def new
    @note = Note.new()
    @current_cabinet = params[:cabinet]
  end

  # Méthode ajoutant une instance de la classe Note dans la base de données
  def create
    @note = Note.new(notes_params())
    if @note.save()
      redirect_to(cabinets_path())
    else
      render("new")
    end
  end

  def edit
    @note = findnote()

end
