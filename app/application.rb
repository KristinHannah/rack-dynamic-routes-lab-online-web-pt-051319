class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      items_title = req.path.split("/items/").last
      item = @@items.find{|s| s.name == items_title}
      if @@items.include?(item)
        resp.write item.price
      else 
        resp.write "Item not found"
        resp.status = 400
      end 
    else 
        resp.write "Route not found"
        resp.status = 404
      end 

    resp.finish
  end
end