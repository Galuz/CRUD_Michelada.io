class ProductosController < ApplicationController
layout "header2"

  def index
    @productos = Producto.sorted
  end

  def show
    @producto = Producto.find(params[:id])
  end
  def new
    @producto = Producto.new({:nombre => "Default"})
    @marcas = Marca.order('position ASC')
    @producto_count = Producto.count + 1
  end
  def create
    @producto = Producto.new(producto_params)
    if @producto.save
      flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
    else
      @marcas = Marca.order('position ASC')
      @producto_count = Producto.count + 1
      render('new')
    end
  end

  def edit
    @producto = Producto.find(params[:id])
    @marcas = Marca.order('position ASC')
    @producto_count = Producto.count
  end
  def update
    @producto = Producto.find(params[:id])
    if @producto.update_attributes(producto_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @producto.id)
    else
      @marcas = Marca.order('position ASC')
      @producto_count = Producto.count
      render('edit')
    end
  end

  def delete
    @producto = Producto.find(params[:id])
  end

  def destroy
    producto = Producto.find(params[:id]).destroy
    flash[:notice] = "Page destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
    def producto_params
      params.require(:producto).permit(:marca_id, :nombre, :descripcion, :precio, :position)
    end
end
