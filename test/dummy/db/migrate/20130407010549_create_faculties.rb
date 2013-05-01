class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|

      t.timestamps
    end
  end
end
