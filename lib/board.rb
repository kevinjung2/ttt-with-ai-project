class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells.clear
    9.times { self.cells << " " }
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2] } "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5] } "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8] } "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.turn_count == 9 ? true : false
  end

  def turn_count
    self.cells.select.with_index(1) { |cell, inx| self.taken?(inx) }.size
  end

  def taken?(input)
    self.position(input) == " " ? false : true
  end

  def valid_move?(input)
      input.to_i.between?(1,9) && self.taken?(input) == false ? true : false
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end
end
