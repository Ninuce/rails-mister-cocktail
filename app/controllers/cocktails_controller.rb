class CocktailsController < ApplicationController

# A user can see the list of cocktails
  def index
    @cocktails = Cocktail.all
  end

  # A user can see the details of a given cocktail, with the dose needed for each ingredient
  def show
    find_cocktail
  end

  # A user can create a new cocktail
  def new
    @cocktail = Cocktail.new(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'cocktail was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def cocktail_params
    return params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end







  # def create
  #   @review = Review.new(review_params)
  #   @cocktail = cocktail.find(params[:cocktail_id])
  #   @review.cocktail = @cocktail
  #   if @review.save
  #     redirect_to cocktail_path(@cocktail)
  #   else
  #     render :new
  #   end
  # end




end



# GET "cocktails"

# GET "cocktails/42"

# GET "cocktails/new"
# POST "cocktails"
