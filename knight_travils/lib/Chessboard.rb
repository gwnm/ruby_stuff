class Chessboard
  require_relative 'square'
  attr_accessor :board

  def initialize
    @board = []
    8.times do |row|
      @board[row] = []
      8.times do |col|
        @board[row] << Square.new(row,col)
      end
    end
  end

  def wrong_move?(move)
    move.first < 0 || move.first >= 8 || move.last < 0 || move.last >= 8
  end

  def calculate_distance(graph, source)
    require_relative 'queue'
    graph[source.first][source.last].distance = 0

    queue = Queue.new
    queue.enqueue(source)

    while !queue.is_empty?
      u = queue.dequeue

      graph[u.first][u.last].neighbors.each do |v|
        if graph[v.first][v.last].distance.nil?
          queue.enqueue(v)
          graph[v.first][v.last].distance = graph[u.first][u.last].distance + 1
          graph[u.first][u.last].predecessor = u
        end
      end
    end

    graph
  end
end
