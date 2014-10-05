class PagesController < ApplicationController
	def main
		unless params.key? 'lat'
			get_location
			return
		end

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

	def get_location
		render 'get_location'
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
