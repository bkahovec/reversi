

proc updateColors { array turn } {

  upvar $array val

  set i 0
  while { $i < 8 } {
    set j 0
    while { $j < 8 } {
      if { $val($i,$j) == 0 } {
        .board.square$i$j configure -bg lightblue
      } elseif { $val($i,$j) == 1 } {
        .board.square$i$j configure -bg white
      } elseif { $val($i,$j) == -1 } {
        .board.square$i$j configure -bg black
      }
      incr j
    }
    incr i
  }

  if { $turn == 1 } {
    .displayTurn configure -disabledbackground white
  } elseif { $turn == -1 } {
    .displayTurn configure -disabledbackground black
  } else {
    .displayTurn configure -disabledbackground lightblue
  }

}


proc reset { } {

  upvar value val
  upvar whiteScore white
  upvar blackScore black
  upvar whoseTurn turn

  set i 0
  while { $i < 8 } {
    set j 0
    while { $j < 8 } {
      set val($i,$j) 0
      incr j
    }
    incr i
  }

  set val(3,3) 1
  set val(3,4) -1
  set val(4,3) -1
  set val(4,4) 1

  set white 2
  set black 2

  set turn 1

  updateColors val $turn

  destroy .console.whiteWins
  destroy .console.blackWins
  destroy .console.tie

  return 0

}