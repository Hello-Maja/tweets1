class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.datetime :time_sent
      t.timestamps
      t.belongs_to :twitter_user
    end
  end
end
