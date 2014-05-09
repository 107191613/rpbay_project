#encoding:utf-8
class ManagerController < ActionController::Base
  layout "manager"
    def index
     @bdareas=Bdarea.find(:all)
    end

  def bdarea_create
    @result="创建成功！"
    begin
      @bdarea=Bdarea.new
      @bdarea.address=params[:bd_name]
      @bdarea.bdpoint=params[:points]
      @bdarea.save
    rescue
      @result="创建失败，请注意，小区名不能重复！"
    end
  end

  #百度地图查询
  def bd_lookup
    bdurl="http://api.map.baidu.com/place/v2/search?&q="+params[:bd_area]+"&region="+
        params[:bd_city]+"&output=json&ak=C4mDur7zkT8qxOTuLCyc2MGT"
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


    #百度地图拖东查询
    def bd_lookup_axis
      bdurl="http://api.map.baidu.com/geocoder/v2/?ak=C4mDur7zkT8qxOTuLCyc2MGT&callback=renderReverse&location="+
          params[:bdlat]+","+params[:bdlng]+"&output=json&pois=0"
      res=httpnetget(bdurl)
      return_body = res.force_encoding('UTF-8')
      .gsub("renderReverse&&renderReverse","")
      .gsub("(",'').gsub(")",'')
      bdjson=JSON.parse(return_body)
      @result=bdjson["result"]
      if !@result.blank?
        @result
        @bddistrict=@result["addressComponent"]["district"]
        @bdroad=@result["formatted_address"]
        @bdlng=@result["location"]["lng"]
        @bdlat=@result["location"]["lat"]
      end
      @mapsize=params[:mapsize]
      @first_page=false
      respond_to do |format|
        format.js
      end
    end
    #httpget
    def httpnetget bdurl
      url_sms = URI::escape(bdurl)
      url=URI.parse(url_sms)
      return res=Net::HTTP.get(url)
    end
end