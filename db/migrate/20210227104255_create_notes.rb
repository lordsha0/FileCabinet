class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :titre
      t.string :contenu
      t.references :cabinet
    end
  end
end
