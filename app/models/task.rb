class Task < ApplicationRecord
	belongs_to :list

	after_initialize :set_initialize_state

	validates :description, presence: true, length: {maximum: 255}
	validates :priority, presence: true, inclusion: { in: [1,2,3]}
	validates :state, inclusion: { in: ['pending', 'complete'] }

	private

	def set_initialize_state
		self.state = 'pending'
	end

end
