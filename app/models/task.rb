class Task < ApplicationRecord
	belongs_to :list

	after_initialize :set_initialize_status

	validates :description, presences:true, lenght: {maximun: 255}
	validates :priority, presences:true, inclusion: { in: [1,2,3]}

	private

	def set_initialize_status
		self.status = 'pending'
	end

end
