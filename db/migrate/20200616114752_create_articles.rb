class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, forign_key: true
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
