class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/items"
      resp.write "You requested the items"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
 
    if req.path.match(/items/)
 
      items_title = req.path.split("/items/").last 
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    end

    resp.finish
  end
end