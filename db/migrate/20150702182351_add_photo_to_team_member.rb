class AddPhotoToTeamMember < ActiveRecord::Migration
  def change
    add_attachment :team_members, :photo
  end
end
