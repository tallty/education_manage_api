class AddSchoolIdToAdmin < ActiveRecord::Migration
  def change
    add_reference :admins, :school
  end
end
