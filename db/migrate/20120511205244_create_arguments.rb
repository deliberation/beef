class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.references :user
      t.references :proposition
      t.float :weight
      t.float :weight_rms
      t.boolean :voted, default: false
      t.text :text
      t.string :side
      t.timestamps
    end
    
    add_index :arguments, [:user_id, :proposition_id, :side], name: 'side'
  end
end
