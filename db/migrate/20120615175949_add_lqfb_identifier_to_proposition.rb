class AddLqfbIdentifierToProposition < ActiveRecord::Migration
  def change
    add_column :propositions, :lqfb_identifier, :string
  end
end
