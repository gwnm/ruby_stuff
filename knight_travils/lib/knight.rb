class Knight
  require_relative 'Chessboard'

  def initialize
    @chessboard = Chessboard.new
    @board_with_knight = build_graph_of_moves
  end

  def build_graph_of_moves
    8.times do |row|
      8.times do |col|
        possible_moves = [[row - 2, col + 1],
                          [row - 1, col + 2],
                          [row + 1, col + 2],
                          [row + 2, col + 1],
                          [row + 2, col - 1],
                          [row + 1, col - 2],
                          [row - 1, col - 2],
                          [row - 2, col - 1]]

        possible_moves.each do |move|
          @chessboard.board[row][col].neighbors << move unless @chessboard.wrong_move?(move)
        end
      end
    end
    @chessboard.board
  end

  def find_path(initial, target)
    @board_with_knight = @chessboard.calculate_distance(@board_with_knight, target)

    path = []
    path << initial

    while @board_with_knight[path.last[0]][path.last[1]].distance != 0
      @board_with_knight[path.last[0]][path.last[1]].neighbors.each do |v|
        if @board_with_knight[v.first][v.last].distance < @board_with_knight[path.last[0]][path.last[1]].distance
          path << v
        end
      end
    end

    path
  end
end