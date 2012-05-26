class CreateArgumentVotes < ActiveRecord::Migration
  def change
    create_table :argument_votes do |t|
      t.references :argument
      t.references :user
      t.references :proposition
      t.float :weight
      t.float :relative_weight
      t.timestamps
    end
  end
end
