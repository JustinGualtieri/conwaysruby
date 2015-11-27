class RulesEngine

  def self.will_be_alive?(me, num_neighbours)
    me.still_alive_with_neighbours?(num_neighbours)
  end

end
