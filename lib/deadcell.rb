require 'living'

class DeadCell
  include Living
  def living_neighbour_count
    [3]
  end

end
