class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :anonymous
      t.bigint :reply_to
      t.bigint :reply_user
      t.datetime :posted_at, null: false

      t.timestamps
    end
  end
end
