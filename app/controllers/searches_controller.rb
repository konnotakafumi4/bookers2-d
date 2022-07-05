class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end

  #サンプルコード
  #def search
	  #@model = params[:model]
	  #@content = params[:content]
	  #@method = params[:method]

	  #if @model == 'user'
		  #@records = User.search_for(@content, @method)
	  #else
		  #@records = Book.search_for(@content, @method)
	  #end
  #end