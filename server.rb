# Friday Challenge #2: Grocery List
# Patrick Kennedy
# 11/21/14

require "pry"
require "sinatra"
require "sinatra/contrib"

# reads the list
def read_list(filename)
  File.readlines(filename)
end

# adds to the list
def add_to_list(filename, food_item)
	File.open(filename, 'a') do |item|
		item.puts("#{food_item} ")
	end
end

# Sets the initial load for the homepage
get '/GET/groceries' do
	@list = read_list('grocery_list.txt')
	erb :index
end

# Calls the post to add to the list and reloads the page
post '/GET/groceries' do
	@item_to_add = params[:GET][:item]
	add_to_list('grocery_list.txt', @item_to_add)
	read_list('grocery_list.txt')
	redirect '/GET/groceries'
end
