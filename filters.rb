# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'date'

def find(id)
  # Use the .find method to iterate over the array of candidates
  # The block checks if the :id of each candidate matches the provided id
  # Returns the first candidate hash where the id matches or nil if no match is found
  @candidates.find { |candidate| candidate[:id] == id }
end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end

  def enough_github_points?(candidate)
    candidate[:github_points] > 100
  end

  def knows_ruby_python?(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end
  
  def date_applied_15_days?(candidate)
    candidate[:date_applied] >= (Date.today - 15)
  end

  def over_age_17?(candidate)
    candidate[:age] > 17
  end
  
  def qualified_candidates(candidates)
    candidates.select do |candidate| 
      experienced?(candidate) && 
      enough_github_points?(candidate) &&
      knows_ruby_python?(candidate) && 
      date_applied?(candidate) &&
      over_age_17?(candidate)
  end

  # Define the ordered_by_qualifications method
def ordered_by_qualifications(candidates)
  candidates.sort_by { 
    |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] 
  }
end
  
  # More methods will go below