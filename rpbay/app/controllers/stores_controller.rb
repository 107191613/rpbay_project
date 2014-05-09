#encoding:utf-8
class StoresController < ActionController::Base
  layout "manager"
  def index
    @stores=Store.find_all_by_bdarea_id(params[:bdarea_id])
  end
  def add_store
    @result="创建成功！"
    begin
     p @bdarea=Bdarea.find(params[:bdarea_id])
      @store=@bdarea.stores.new
      @store.points=params[:points]
      @store.name=params[:name]
      @store.save
    rescue
      @result="创建失败，请注意，小区名不能重复！"
    end
  end
end