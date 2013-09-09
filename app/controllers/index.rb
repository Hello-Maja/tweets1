get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
end
