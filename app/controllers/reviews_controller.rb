class ReviewsController < ApplicationController
  before_action :set_review_restaurant, only: %i[new index show create]
  before_action :set_review, only: %i[destroy edit update]

  def index
    @reviews = @restaurant.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @review.update(review_params)
      redirect_to @review.restaurant
    else
      render :edit
    end
  end

  def destroy
    @review.destroy

    redirect_to @review.restaurant
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_review_restaurant
    @restaurant = Restaurant.find(params['restaurant_id'])
  end

  def set_review
    @review = Review.find(params['id'])
  end
end
