class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|

      t.timestamps null: false
    end
  end
end
