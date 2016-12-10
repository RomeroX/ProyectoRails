class Task < ApplicationRecord
	belongs_to :list

	after_initialize :set_initialize_state

	validates :description, presences:true, lenght: {maximum: 255}
	validates :priority, presences:true, inclusion: { in: [1,2,3]}
	validates :state, inclusion: { in: [pending, complete] }

	private

	def set_initialize_state
		self.state = 'pending'
	end

end
