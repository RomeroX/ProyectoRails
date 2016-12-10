class ProgressiveTask < Task 

  after_initialize :set_initilize_progress 

  validates :state, inclusion: { in:[pending, complete, in_progress]}

  private

  def set_initialize_progress
    self.progress = 0
end

end
