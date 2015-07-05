class AddPhotoToBiography < ActiveRecord::Migration
  def change
    add_attachment :biographies, :photo
  end
end
