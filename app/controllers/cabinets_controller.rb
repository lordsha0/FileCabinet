class CabinetsController < ApplicationController
  # Méthode affichant tous les tiroirs
  def index
    @tabtiroirs = Cabinet.all()
    @tabNotes = Note.all()
  end

  # Méthode affichant un seul tiroir
  def show
    @tiroir = findtiroir()
    @tabNotes = Note.where("cabinet_id": @tiroir.id)
  end

  # Méthode affichant un formulaire pour la création d'une nouvelle instance de la classe Cabinet
  def new
    @tiroir = Cabinet.new()
  end

  # Méthode ajoutant une instance de la classe Cabinet dans la base de données
  def create
    @tiroir = Cabinet.new(tiroir_params())
    if(@tiroir.save())
      flash[:notice] = "Le tiroir #{@tiroir.nom} a été créé!"
      redirect_to(cabinet_path(@tiroir))
    else
      render("new")
    end
  end

  #
  def edit
    @tiroir = findtiroir()
  end

  #
  def update
    @cabinet = findtiroir()
    if(@cabinet.update(tiroir_params))
      redirect_to(cabinets_path(@cabinet))
    else
      render("edit")
    end
  end

  #
  def destroy
    @tiroir = findtiroir()
    @tiroir.destroy()
    redirect_to cabinets_path
  end

  private
    # Méthode accèdant aux champs du formulaire de création
    def tiroir_params
      params.require(:cabinet).permit(:nom)
    end

    # Méthode cherchant un tiroir en particulier
    def findtiroir
      Cabinet.find(params[:id])
    end
end
