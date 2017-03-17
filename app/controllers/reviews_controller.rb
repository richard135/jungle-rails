class ReviewsController < ApplicationController
before_action :require_login

def create
  @product = Product.find(params[:product_id])
  @review = @product.reviews.new(review_params)
  @review.user = current_user
  if @review.save
    redirect_to :back
  else
    redirect_to :back
  end
end


def destroy
  review = Review.find(params[:id])
  review.destroy
  redirect_to :back
end

  private
    def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
    end

    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login'# halts request cycle
      end
    end
end
