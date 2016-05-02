class AddNameToAffiliations < ActiveRecord::Migration
  def change
    add_column :affiliations, :name, :string
  end
end
