class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:show, :new, :create]
  def new
    @review = Review.new
  end

  def show
  end

  def create
    @review = @restaurant.reviews.create(review_params)
    if @review.save
      redirect_to restaurant_path(id: @restaurant.id)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  private
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
