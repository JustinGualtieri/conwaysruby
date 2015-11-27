module Living
  def still_alive_with_neighbours?(num_neighbours)
    living_neighbour_count.include?(num_neighbours)
  end
end
