class PagesController < ApplicationController
	def main
		unless params.key? 'num_people'
			get_num_people
			return
		end

		unless params.key? 'budget'
			get_budget
			return
		end

		get_result
	end

	def get_num_people
		render 'get_num_people'
	end

	def get_budget
		render 'get_budget'
	end

	def get_result
		render 'get_result'
	end
end
