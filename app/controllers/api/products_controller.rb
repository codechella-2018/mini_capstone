class Api::ProductsController < ApplicationController
  def index

    @products = Product.all
    
    name_search = params[:search]
    if name_search
      @products = Product.where("name LIKE ?", "%#{name_search}%")
    end

    if params[:price_sort]
      @products = @products.order(price: :asc)
    else
      @products = @products.order(id: :asc)
    end

    render 'index.json.jbuilder'
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )

    @product.save
    render 'show.json.jbuilder'
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    
    @product.save
    render 'show.json.jbuilder'
  end

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end
end