class CreateGlobalRoles < ActiveRecord::Migration
  def change
    create_table :global_roles do |t|

      t.timestamps
    end
  end
end
