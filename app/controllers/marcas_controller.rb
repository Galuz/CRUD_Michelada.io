class MarcasController < ApplicationController
  layout "header"

  def index
    @marcas = Marca.sorted
  end

  def show
    @marca = Marca.find(params[:id])
  end

  def new
    @marca = Marca.new({:nombre => "Default"})
    @marca_count = Marca.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    @marca = Marca.new(marca_params)
    # Save the object
    if @marca.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Marca Creada con Exito"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @marca_count = Marca.count +1
      render('new')
    end
  end

  def edit
    @marca = Marca.find(params[:id])
    @marca_count = Marca.count
  end

  def update
    # Find an existing object using form parameters
    @marca = Marca.find(params[:id])
    # Update the object
    if @marca.update_attributes(marca_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Marca Actualizada con Exito."
      redirect_to(:action => 'show', :id => @marca.id)
    else
      # If update fails, redisplay the form so user can fix problems
      @marca_count = Marca.count
      render('edit')
    end
  end

  def delete
    @marca = Marca.find(params[:id])
  end

  def destroy
    marca = Marca.find(params[:id]).destroy
    flash[:notice] = "Marca '#{marca.nombre}' Eliminada con Exito."
    redirect_to(:action => 'index')
  end

  private
    def marca_params
      params.require(:marca).permit(:nombre, :position)
    end
end
