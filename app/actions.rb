# Homepage (Root path)
helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    if cookies[:user_id]
      User.find(cookies[:user_id])
    end
  end

end

get '/' do
  erb :index
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

get '/signup' do
  erb :'users/new'
end

get '/login' do
  erb :'users/login'
end

get '/logout' do
  cookies.delete :user_id
  redirect '/'
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user
    if @user.password == params[:password]
      cookies[:user_id] = @user.id
      redirect '/tracks'
    else
      wrong password page
    end
  else
    erb :'users/new'
  end
end

post '/users' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    cookies[:user_id] = @user.id
    redirect '/tracks'
  else
    erb :'users/new'
  end
end

post '/tracks' do
  @track = Track.new(
    artist:  params[:artist],
    title: params[:title],
    url: params[:url]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

post '/track/:id/upvote' do
  Upvote.create(user_id: current_user.id, track_id: params[:id])
  redirect '/tracks'

end