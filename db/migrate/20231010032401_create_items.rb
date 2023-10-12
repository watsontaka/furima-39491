class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string        :item_name,      null: false
      t.text          :explain,        null: false
      t.integer       :category_id,    null: false
      t.integer       :quality_id,     null: false 
      t.integer       :cost_id,        null: false
      t.integer       :region_id,      null: false 
      t.integer       :period_id,      null: false 
      t.integer       :price,          null: false 
      t.references    :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
