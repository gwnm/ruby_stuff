class Square
    attr_accessor :row, :column, :distance, :predecessor, :neighbors
    def initialize(row, column)
      @row = row
      @column = column
      @neighbors = []
    end
  end
  