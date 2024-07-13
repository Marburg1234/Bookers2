class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      # 投稿したユーザーID
      t.integer :user_id

      # 投稿するタイトル
      t.string :title

      # 投稿する内容
      t.text :opinion

      t.timestamps
    end
  end
end
