class PagesController < ApplicationController
  def home
    @derniertiroir = Cabinet.last()
    @tabNotes = Note.where("cabinet_id": @derniertiroir.id)
  end
end
