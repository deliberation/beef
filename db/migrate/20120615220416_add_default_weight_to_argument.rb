class AddDefaultWeightToArgument < ActiveRecord::Migration
  def change
    change_column :arguments, :weight, :float, :default => 0
  end
end
