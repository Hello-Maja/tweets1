class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.timestamps
      t.belongs_to :twitter_user
    end
  end
end
