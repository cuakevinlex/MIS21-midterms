require 'sinatra'
require './expense.rb'

expenses = Array.new


get '/' do
	@everything = ""
	@total_amount = 0
	expenses.each do |expense|
		@everything += "<p>Expense ID: #{expense.id}, Expense Item #{expense.item}, Expense Amount: #{expense.amount}</p><br />"
	end

	expenses.each do |expense|
		@total_amount = @total_amount + expense.amount.to_f
	end
	@everything += "<h3>Total Expenses: #{total_amount}</h3>"
	def print
		@everything
	end
	erb :index
end

	
get '/new' do
	erb :new
end

post '/new' do
	@some_item = params[:item]
	@some_amount = params[:amount]
	if expenses.last == nil
		@some_id = 1
	else
		@some_id = expenses.last.id + 1
	end
	@new_expense = Expense.new(@some_id, @some_item, @some_amount)
	adder(@new_expense)
	erb :new
end

get '/save' do
	redirect to'/'
end

get '/show/:id' do
	erb :show
end


define_method(:adder) do |expense|
	expenses << expense
end

expenses.each do |expense|
	everything = "<p>#{expense.id}, #{expense.item}, expense.#{amount}</p><br />"
end

expenses.each do |expense|
	total_amount = "total_amount + expense.amount"
end

