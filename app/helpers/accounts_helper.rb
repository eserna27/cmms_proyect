module AccountsHelper

	def max_equipment
		@account.plan.max_equipment
	end
end
