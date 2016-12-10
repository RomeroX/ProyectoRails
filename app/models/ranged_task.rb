class RangedTask < Task
	 validates :state, inclusion: { in: [pending, complete, expired] }
end
