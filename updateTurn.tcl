


proc availableMoves { array } {

  upvar $array val
  set outList [list]
  set surListWhite [list]
  set surListBlack [list]

  set white 0
  set black 0

  set i 0
  while { $i < 8 } {
    set j 0
    while { $j < 8 } {

      if { $val($i,$j) != 0 } {
        # not an available space
      } else {

        if { $white == 0 } {

          # check for moves
          # find indices surrounding i,j
          set surList [surroundingIndices $i $j]
          # remove indices where value is 0 or 1
          set surListWhite [removeIndices 1 $i $j $surList val]
          # find endpoints where values are not equal to 0,1
          set endPointsWhite [search 1 $i $j $surListWhite val]
          if { [llength $endPointsWhite] != 0 } {
            lappend outList 1
            set white 1
          }
        }

        if { $black == 0 } {

          # check for moves
          # find indices surrounding i,j
          set surList [surroundingIndices $i $j]
          # remove indices where value is 0 or -1
          set surListBlack [removeIndices -1 $i $j $surList val]
          # find endpoints where values are not equal to 0 or -1
          set endPointsBlack [search -1 $i $j $surListBlack val]
          if { [llength $endPointsBlack] != 0 } {
            lappend outList -1
            set black 1
          }
        }

        if { $white == 1 && $black == 1 } {
          return $outList
        }

      }


      incr j
    }
    incr i
  }

  return $outList

}

proc updateTurn { array } {

  upvar whoseTurn turn
  upvar $array val

  set testList [availableMoves val]
  if { [llength $testList] == 0 } {
    # no available moves
    # game over
    gameOver val
  } elseif { [llength $testList] == 1 } {
    # only one player can play
    # so it is his turn
    set turn [lindex $testList 0]
  } else {
    # both players can play
    # do not update turn
  }

  upvar whiteScore white
  upvar blackScore black

  set scoreList [score val]
  set white [lindex $scoreList 0]
  set black [lindex $scoreList 1]
  return 0

}

proc score { array } {

  upvar $array val

  set black 0
  set white 0

  set i 0
  while { $i < 8 } {
    set j 0
    while { $j < 8 } {
      if { $val($i,$j) == 0 } {
        # do nothing
      } elseif { $val($i,$j) == 1 } {
        incr white
      } elseif { $val($i,$j) == -1 } {
        incr black
      }
      incr j
    }
    incr i
  }

  return [list $white $black]

}


proc gameOver { array } {

  upvar $array val
  upvar 2 whoseTurn turn
  set scoreList [score val]
  set white [lindex $scoreList 0]
  set black [lindex $scoreList 1]

  set turn 0

  if { $white > $black } {
    # white wins
    message .console.whiteWins -text "White wins!" -bg blue -fg white -aspect 500
    pack .console.whiteWins
  } elseif { $white < $black } {
    # black wins
    message .console.blackWins -text "Black wins!" -bg blue -fg white -aspect 500
    pack .console.blackWins
  } else {
    # tie
    message .console.tie -text "Tie game!" -bg blue -fg white -aspect 500
    pack .console.tie
  }

}