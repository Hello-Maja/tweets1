get '/' do
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_by_handle(params[:username])
  
  if @user && @user.tweets_stale?
    # User#fetch_tweets! should make an API call
    # and populate the tweets table
    #
    # Future requests should read from the tweets table 
    # instead of making an API call
    @user.fetch_tweets!

  else
    @user = TwitterUser.create(handle: params[:username])
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
  @tweets.reverse!
 
  ### this was for Recent Tweets (not cached)
  # @user_name = params[:username]
  #   @tweets = Twitter.user_timeline(params[:username]).take(10)
  erb :show_tweets
end

post '/find_user' do

  redirect to "/#{params[:handle]}"
end

post '/tweet' do
  p params
  "hi"
end
