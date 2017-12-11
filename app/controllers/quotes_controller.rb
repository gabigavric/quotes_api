class QuotesController < ApplicationController

  def index
    @quotes = {"quotation": "The secret of getting ahead is getting started."}
    json_response(@quotes)
  end

  def show
   @quote = Quote.find(params[:id])
   json_response(@quote)
 end

 def create
   @quote = Quote.create!(quote_params)
   json_response(@quote)
 end

 def update
   @quote = Quote.find(params[:id])
   @quote.update(quote_params)
    if @quote.update!(quote_params)
      json_response({ message: exception.message }, :not_found)
 end


 def destroy
   @quote = Quote.find(params[:id])
   @quote.destroy
 end

 # def destroy
 #   @quote = Quote.find(params[:id])
 #   if @quote.destroy
 #     render status: 200, json: {
 #       message: "Your quote has been deleted successfully"
 #     }
 #   end
 # end

  private

  def quote_params
      params.permit(:author, :content)
  end

end
