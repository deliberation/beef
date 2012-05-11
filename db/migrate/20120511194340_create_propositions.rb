class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.references :user
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
