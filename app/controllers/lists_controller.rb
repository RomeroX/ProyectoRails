class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def new
  	@list = List.new
  end

  def create
  	@list = List.new (list_params)

  	 respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  def last_five
  end

  def show
  end

   def set_list
      @list = List.find(params[:id])
    end

   private

   def list_params
      params.require(:list).permit(:title)
    end
end
