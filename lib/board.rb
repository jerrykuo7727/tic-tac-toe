class Board
  attr_reader :turn

  def initialize
  	@blocks = Array.new(10, "　")
  	@turns = ["Ｏ", "Ｘ"]
  	@turn = "Ｏ"
  	@round = 0
  	@gameover = false
  end

  def ask_to_draw
  	print "It's turn of '#{@turn}'. Where to draw: "
  end

  def try_to_draw(num)
  	num -= 1 # turn block number to real index
    if drawable?(num)
      draw(num)
      false
    else
      puts "Block #{num + 1} is drawn already! "
      true
    end
  end

  def gameover?
  	if line_match?
  	  switch
      @turn
    elsif tie?
      "tie"
    else
      false
    end
  end

  def tie?
    @round == 9
  end

  def display
  	puts "#{@blocks[6]}｜#{@blocks[7]}｜#{@blocks[8]}"
  	puts "－＋－＋－"
  	puts "#{@blocks[3]}｜#{@blocks[4]}｜#{@blocks[5]}"
  	puts "－＋－＋－"
  	puts "#{@blocks[0]}｜#{@blocks[1]}｜#{@blocks[2]}"
  end

  private

  def draw(num)	 
    @blocks[num] = @turn
    switch
    @round += 1
  end

  def drawable?(num)
    @blocks[num] == "　"
  end

  def line_match?
  	row_match? || col_match? || diagonal_match?
  end

  def row_match?
  	match ||= @blocks[0] == @blocks[1] && @blocks[1] == @blocks[2] && @blocks[0] != "　"
  	match ||= @blocks[3] == @blocks[4] && @blocks[4] == @blocks[5] && @blocks[3] != "　"
  	match ||= @blocks[6] == @blocks[7] && @blocks[7] == @blocks[8] && @blocks[6] != "　"
  	match
  end

  def col_match?
  	match ||= @blocks[0] == @blocks[3] && @blocks[3] == @blocks[6] && @blocks[0] != "　"
  	match ||= @blocks[1] == @blocks[4] && @blocks[4] == @blocks[7] && @blocks[1] != "　"
  	match ||= @blocks[2] == @blocks[5] && @blocks[5] == @blocks[8] && @blocks[2] != "　"
  	match
  end

  def diagonal_match?
    match ||= @blocks[0] == @blocks[4] && @blocks[4] == @blocks[8] && @blocks[0] != "　"
  	match ||= @blocks[2] == @blocks[4] && @blocks[4] == @blocks[6] && @blocks[2] != "　"
  	match
  end

  # switch between "O" amd "X"
  def switch
  	@turn = @turns.reject { |e| e == @turn }.join
  end
end