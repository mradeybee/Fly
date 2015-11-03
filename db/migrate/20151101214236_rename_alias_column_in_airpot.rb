class RenameAliasColumnInAirpot < ActiveRecord::Migration
  def change
  	rename_column :airports, :alias, :abrv 
  end
end
