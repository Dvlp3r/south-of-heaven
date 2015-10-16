class Artist < ActiveRecord::Base

  def get_instagram_auth
    redirect_to Instagram.authorize_url(:redirect_uri => "http://localhost:3000/oauth/callback")
  end

  def set_artist_instagram_session
    response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
    session[:access_token] = response.access_token
    redirect_to artist
  end

  def set_artist_instagram
    client = Instagram.client(:access_token => session[:access_token])
    @artist = client.user  
  end

end
