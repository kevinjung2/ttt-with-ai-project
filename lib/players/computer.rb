module Players
  class Computer < Player
    def move(board)
      available = []
      board.cells.each.with_index(1) { |cell, inx| available << inx if board.taken?(inx) == false }
      move = available.sample(1).join
      board.update(move, self)
      move
    end
  end
end
