require 'livingcell'
require 'rulesengine'
require 'deadcell'

describe "rules engine" do

  context "Any live cell with fewer than two live neighbours
  dies, as if caused by under-population." do

    [
      {
        me: LivingCell.new,
        my_neighbours: 0
      },
        {
          me: LivingCell.new,
          my_neighbours: 1
        }
    ].each do |test|
      it "should die with #{test[:my_neighbours]} neighbours" do
        expect(RulesEngine.will_be_alive?(test[:me], test[:my_neighbours])).to eq(false)
      end
    end
  end

  context "Any live cell with two or three live
  neighbours lives on to the next generation." do
    [
      {
      me: LivingCell.new,
      my_neighbours: 2
      },
        {
          me: LivingCell.new,
          my_neighbours: 3
        }
    ].each do |test|
      it "should remain living with #{test[:my_neighbours]} neighbours" do
        expect(RulesEngine.will_be_alive?(test[:me], test[:my_neighbours])).to eq(true)
      end
    end
  end

  context "Any live cell with more than
  three live neighbours dies, as if by over-population." do
    it "should die with four neighbours" do
      me = LivingCell.new
      my_neighbours = 4
      expect(RulesEngine.will_be_alive?(me, my_neighbours)).to eq(false)
    end
  end

  context "Any dead cell with exactly three live neighbours
  becomes a live cell, as if by reproduction." do
    it "should come to life with 3 neighbours" do
      me = DeadCell.new
      my_neighbours = 3
      expect(RulesEngine.will_be_alive?(me, my_neighbours)).to eq(true)
    end

    it "should remain dead with 2 neighbours" do
      me = DeadCell.new
      my_neighbours = 2
      expect(RulesEngine.will_be_alive?(me, my_neighbours)).to eq(false)
    end
  end
end
