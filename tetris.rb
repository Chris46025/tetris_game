require 'ruby-processing'

class Tetris < Processing::App

	def setup
	smooth
    background(0, 0, 0)

	end

	def draw
		@x @y
		if (@x.nil?&&@y.nil?)
			@x=175
			@y=0
			@tetromino_pieces=rand(7)
		elsif @y>=475&&y<=480
			@x=175
			@y=0
            @tetromino_pieces=rand(7)
		end
		
		gravity
		tetrominos
	end

	def key_pressed
		warn "#{key.inspect} was pressed" 
		if key=="a"
			@x-=25
		end
		if key=="d"
			@x+=25
		end
		if key=="s"
			@y+=1
		end
	end

	def tetrominos
		@tetromino_pieces
		if @tetromino_pieces.nil?
			@tetrominos_pieces=0
			
		end
		
		if @tetromino_pieces==0
			fill(0,255,255)
		    rect(@x, @y,25,25)
		    rect(@x+25, @y,25,25)
		    rect(@x+50, @y,25,25)
		    rect(@x+75, @y,25,25)

		elsif @tetromino_pieces==1
			fill(0,0,255)
			rect(@x+25, @y-25,25,25)
		    rect(@x+25, @y,25,25)
		    rect(@x+50, @y,25,25)
		    rect(@x+75, @y,25,25)

		elsif @tetromino_pieces==2
			fill(135,31,120)
			rect(@x, @y,25,25)
		    rect(@x+25, @y,25,25)
		    rect(@x+50, @y,25,25)
		    rect(@x+25, @y-25,25,25)
		    	
		elsif @tetromino_pieces==3
			fill(255,140,0)
			rect(@x, @y,25,25)
		    rect(@x+25, @y,25,25)
		    rect(@x+50, @y,25,25)
		    rect(@x+50, @y-25,25,25)

		elsif @tetromino_pieces==4
			fill(255,255,0)
			rect(@x+25, @y-25,25,25)
		    rect(@x+25, @y,25,25)
		    rect(@x+50, @y,25,25)
		    rect(@x+50, @y-25,25,25)

		elsif @tetromino_pieces==5
			fill(255,0,0)
			rect(@x+25, @y+25,25,25)
		    rect(@x+25, @y,25,25)
		    rect(@x+50, @y,25,25)
		    rect(@x+50, @y-25,25,25)

		elsif @tetromino_pieces==6
			fill(0,255,0)
			rect(@x+25, @y-25,25,25)
		    rect(@x+25, @y,25,25)
		    rect(@x+50, @y,25,25)
		    rect(@x+50, @y+25,25,25)
		end

     	return @tetromino_pieces
	end

	def gravity
		@gravity
		if @gravity.nil?
			@gravity=0
		elsif @gravity==-2
			@gravity=0
		end
		@gravity-=1
		@y-=@gravity
		return @y
	end

end

Tetris.new(:width => 500, :height => 500,
  :title => "Tetris", :full_screen => false)