class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You haven't entered anything in the search box."
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Incorrect stock symbol." unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end
