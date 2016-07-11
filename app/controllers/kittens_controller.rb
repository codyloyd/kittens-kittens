class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.xml {render :xml => @kittens}
      format.json {render :json => @kittens}
    end
  end
  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @kitten}
      format.json {render :json => @kitten}
    end
  end
  def new
    @kitten = Kitten.new
  end
  def create
    kitten = Kitten.new
    kitten.name = params[:kitten][:name]
    kitten.cuteness = params[:kitten][:cuteness]
    kitten.softness = params[:kitten][:softness]
    kitten.age = params[:kitten][:age]
    kitten.save
    flash[:success] = "kitten created"
    redirect_to kitten
  end
  def edit
    @kitten = Kitten.find(params[:id])
  end
  def update
    kitten = Kitten.find(params[:id])
    kitten.update_attributes(name:params[:kitten][:name],
                             age:params[:kitten][:age],
                             cuteness:params[:kitten][:cuteness],
                             softness:params[:kitten][:softness])
   kitten.save
   flash[:success] = "kitten updated!"
   redirect_to kitten
  end
  def destroy
    kitten = Kitten.find(params[:id])
    kitten.delete
    flash[:success] = "kitten destroyed"
    redirect_to root_url
  end

end
