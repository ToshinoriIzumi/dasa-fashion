class FashionPostsController < ApplicationController
  def index
    @fashion_post = FashionPost.new
  end

  def result
    @fashion_post = FashionPost.find(session[:id])
  end

  def predict
    id = FashionPost.predict(fashion_post_params)
    session[:id] = id
    redirect_to fashion_post_result_path
  end

  private
    def fashion_post_params
      params.require(:fashion_post).permit(:image)
    end
end
