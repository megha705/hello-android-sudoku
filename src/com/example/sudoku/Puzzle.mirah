package com.example.sudoku

import java.util.ArrayList
import java.util.List
import java.util.HashSet
import java.lang.StringBuilder
import android.util.Log

class Puzzle
  class Tile
    def initialize(v:Integer)
      @value = v
    end
    def value:Integer
      @value
    end
    def value=(v:Integer)
      @value = v
    end
    def is_used
      value != Integer.valueOf(0)
    end
    def toString
      to_s
    end
    def to_s
      s = " "
      if is_used
        s = String.valueOf(@value) 
      end
      return s
    end
  end

  def initialize(values:List)
    @values = ArrayList.new
    for v in values
      @values.add(Tile.new(Integer(v)))
    end
    @t = @values.get(0)
    Log.d("Puzzle", @values.toString)
  end

  def calculateUsedTiles(x:int, y:int)
    used = HashSet.new
    #horizontal
    i = 0
    while (i < 9)
      if (i != x)
        tile = getTile(i, y)
        used.add(tile.value) if tile.is_used
      end
      i+=1
    end

    #vertical
    i = 0
    while (i < 9)
      if (i != y)
        tile = getTile(x, i)
        used.add(tile.value) if tile.is_used
      end
      i+=1
    end

    # same block
    startx = (x/3)*3
    starty = (y/3)*3
    i = startx
    j = starty
    while (i < startx + 3)
      while (j < starty + 3)
        if (i == x && j == y)
          tile = getTile i, j
          used.add(tile.value) if tile.is_used
        end
        j+=1
      end
      i+=1
    end
    used
  end

  def getTile(x:int, y:int):Tile
    Tile(@values.get( y*9 +x))
  end

  def getTileString(x:int, y:int)
    getTile(x,y).to_s
  end

end