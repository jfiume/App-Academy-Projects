require_relative 'Piece'

class Board
  def initialize
    empty_board = Array.new(4) { Array.new(8) }
    black_pieces = Array.new(2) { Array.new(8, Piece.new) }
    white_pieces = Array.new(2) { Array.new(8, Piece.new) }
    @grid = black_pieces + empty_board + white_pieces
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
  end_row, end_col = end_pos
    raise StandardError.new("piece missing?")  if self[start_pos].nil?
    raise StandardError.new("off grid") if end_row < 0 || end_row > 8
    raise StandardError.new("off grid") if end_col < 0 || end_col > 8

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end
end
