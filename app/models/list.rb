class List < ApplicationRecord
	
  has_many :tasks, dependent: :destroy

  before_validation :generate_url, if: "title", unless: "url"

  validates :title, presence: true, uniqueness: true 
  validates :url, uniqueness: true 
  
  def generate_url
    self.url = slug_from(self.title)
  end

  def slug_from(string)
    chars_to_remove = '.,?!*()~`<>:[]/'.split('')

    chars_to_replace = { 
      'á' => 'a',
      'é' => 'e',
      'í' => 'i',
      'ó' => 'o',
      'ú' => 'u',
      'ñ' => 'n'
    }
    
    replaced_string = replace_all(chars_to_replace, string)
    removed_string = remove_all(chars_to_remove, string)
    stripped_string = removed_string.strip
    string_with_hyphens = replace_all({' ' => '-'}, stripped_string)

    string_with_hyphens.downcase
  end

  def tasks_by(attribute)
    raise "#{attribute} is not a valid attribute!" unless attributes.keys.include? attribute.to_s
    self.tasks.sort { |lesser, greater| lesser.priority <=> greater.priority }
    # COMMENT: Priorities should be numeric to allow for taslk list sorting.
  end

  private

  def replace_all(mappings, string)
    mappings.reduce(string) do |result, (original, new)|
      result.gsub(original, new)
    end
  end

  def remove_all(chars, string)
    chars.reduce(string) do |result, char|
      result.gsub(char, '')
    end
  end
      
end
