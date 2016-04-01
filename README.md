When testing with stripe ask someone for the login to our stripe account.

After logging in please use the test API keys, NEVER use production keys.

Store these inside the app/config/application.yml file - following the below format;-

'''APP_URL: "http://localhost:3000/"
gmail_username: "GMAIL_USER"
gmail_password: "GMAIL_PASS"

STRIPE_PUBLISHABLE_KEY: "STRIPE_PUBLISHABLE"
STRIPE_SECRET_KEY: "STRIPE_SECRET"'''

Use stripes documentation here to simulate different card payment with success returns or fail returns: https://stripe.com/docs/testing


*--------------------*

If you need to create a new service object please follow these steps
- first go to the config/application.rb and find the following lines:
 -  config.autoload_paths += %W(#{config.root}/app/services/ #{config.root}/app/services/payments)
 -  config.eager_load_paths += %W(#{config.root}/app/services/ #{config.root}/app/services/payments)
or similar to the above.

after the '#{config.root}/app/services/payments' add your file path if you need a new file path for example if you need a folder called expenses do the following
    config.autoload_paths += %W(#{config.root}/app/services/ #{config.root}/app/services/payments #{config.root}/app/services/expenses)
    config.eager_load_paths += %W(#{config.root}/app/services/ #{config.root}/app/services/payments #{config.root}/app/services/expenses)
This will autoload the paths to be used, once this is done inside your file path(ours will be app/services/expenses) add a file name based around the names/verbs/actions of the
methods inside the folder. For exmaple we will be handling our expense sheet, so our's would be named:
handle_expense_sheet.rb

inside do the following layout:

class HandleExpenseSheet
	attr_accessor :expense, :current_user
	def initialize(expense, user)
		@expense, @current_user = expense, user
	end

	def get_user_expenses
		@expense.each do |exp|
			exp.name + ' : ' + exp.date
		end
	end

	def find_users_expenses
		Expense.where("user_name LIKE ? AND user_id LIKE ?", @current_user.username, @current_user.id)
	end
end

To use these do the following inside the controller;-
@expenseHandler = HandleExpenseSheet.new(@expense, @current_user)
@expenseHandler.get_user_expenses #=> name 20/03/2016 etc....
@expenseHandler.find_user_expenses #=> [exp, exp, exp] etc...

This is all for now.