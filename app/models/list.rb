class List < ApplicationRecord
	
  has_many :tasks, dependent: :destroy

  before_validation :create_url, if: "title", unless: "url"

  validates :title, presence: true, uniqueness: true 
  validates :url, uniqueness: true 
  
  def create_url
    self.url = self.title.parameterize
  end


  def tasks_by(attribute)
    raise "#{attribute} is not a valid attribute!" unless attributes.keys.include? attribute.to_s
    self.tasks.sort { |lesser, greater| lesser.priority <=> greater.priority }
  end

      
end
