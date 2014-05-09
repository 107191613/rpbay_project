#encoding:utf-8
class ProductsController < ActionController::Base
  layout "manager"
  def index
    @products=Product.find_all_by_store_id(params[:store_id])
  end
  def add_product
    @result="创建成功！"
    begin
     p @store=Store.find(params[:store_id])
     @product=@store.products.new
     @product.name=params[:name]
     @product.save
    rescue
      @result="创建失败，请注意，小区名不能重复！"
    end
  end
end