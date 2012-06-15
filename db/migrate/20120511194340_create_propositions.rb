class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.references :user
      t.string :title
      t.string :identifier
      t.text :reason
      t.text :text

      t.timestamps
    end
  end
end
