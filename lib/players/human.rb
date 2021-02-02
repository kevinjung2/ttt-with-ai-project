module Players
  class Human < Player
    def move(board)
      puts "Please make a move 1-9"
      input = gets.strip
      board.valid_move?(input) ? board.update(input, self) : self.move(board)
      input
    end
  end
end
