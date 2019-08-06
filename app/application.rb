class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    @@items = []
 
    if req.path.match(/items/)
      items_title = req.path.split("/items/").last 
      if @@items.include?(items_title)
        resp.write items_title.price
      else 
        resp.write "item not found"
        resp.status = 400
      end 
    else 
        resp.write "Route not found"
        resp.status = 404
      end 

    resp.finish
  end
end