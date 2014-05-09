#encoding:utf-8
class Point2loveController < ApplicationController
  def index

  end
  def look_up
   @bdarea=Bdarea.find_by_address(params[:bd_name])
  p @address= !@bdarea.blank? ? @bdarea.address : params[:bd_name]
   bdurl="http://api.map.baidu.com/place/v2/search?&q="+@address+"&region=成都&output=json&ak=C4mDur7zkT8qxOTuLCyc2MGT"
   res=httpnetget(bdurl)
   bdjson=JSON.parse res
   @results=bdjson["results"]
   if !@results.blank?
     @results[0]
     @bddistrict=@results[0]["address"]
     @bdroad=@results[0]["name"]
     @bdlng=@results[0]["location"]["lng"]
     @bdlat=@results[0]["location"]["lat"]
   end
   @mapsize=15
   @first_page=false
   respond_to do |format|
     format.js
   end

  end
  def get_store
      @store=Store.find(params[:store_id])
      @products=@store.products
  end

  def httpnetget bdurl
    url_sms = URI::escape(bdurl)
    url=URI.parse(url_sms)
    return res=Net::HTTP.get(url)
  end
end
