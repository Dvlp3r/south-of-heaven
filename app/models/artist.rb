class Artist < ActiveRecord::Base

  callback_url = "http://localhost:3000/artists/"

  def get_instagram_auth
    redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def set_artist_instagram_session
    response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
    session[:access_token] = response.access_token
    redirect "/nav"
  end

  def set_artist_instagram
    client = Instagram.client(:access_token => session[:access_token])
    @artist = client.user  
  end

end
