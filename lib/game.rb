class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    self.board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      # binding.pry
      return combo if self.board.position(combo[0]+1) != " " && self.board.position(combo[0]+1) == self.board.position(combo[1]+1) && self.board.position(combo[1]+1) == self.board.position(combo[2]+1)
    end
    false
  end

  def draw?
    self.board.full? && self.won? == false ? true : false
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    else
      nil
    end
  end

  def turn
    self.current_player.move(self.board)
  end

  def play
    while self.over? == false
      self.turn
    end
    if self.winner == "X"
      puts "Congratulations X!"
    elsif self.winner == "O"
      puts "Congratulations O!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end
