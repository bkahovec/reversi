

proc surroundingIndices { i j } {

  if { $i == 0 } {
    if { $j == 0 } {
      set list1 [list 0 1 1 1 1 0]
    } elseif { $j == 7 } {
      set list1 [list 0 6 1 6 1 7]
    } else {
      set list1 [list 0 [expr {$j-1}] 0 [expr {$j+1}] 1 [expr {$j-1}] 1 $j 1 [expr {$j+1}]]
    }
  } elseif { $i == 7 } {
    if { $j == 0 } {
      set list1 [list 6 0 6 1 7 1]
    } elseif { $j == 7 } {
      set list1 [list 7 6 6 6 6 7]
    } else {
      set list1 [list 7 [expr {$j-1}] 7 [expr {$j+1}] 6 [expr {$j-1}] 6 $j 6 [expr {$j+1}]]
    }
  } else {
    if { $j == 0 } {
      set list1 [list [expr {$i-1}] 0 [expr {$i+1}] 0 [expr {$i-1}] 1 $i 1 [expr {$i+1}] 1]
    } elseif { $j == 7 } {
      set list1 [list [expr {$i-1}] 7 [expr {$i+1}] 7 [expr {$i-1}] 6 $i 6 [expr {$i+1}] 6]
    }  else {
      set list1 [list [expr {$i-1}] [expr {$j-1}] [expr {$i-1}] $j [expr {$i-1}] [expr {$j+1}] $i [expr {$j-1}] $i [expr {$j+1}] [expr {$i+1}] [expr {$j-1}] [expr {$i+1}] $j [expr {$i+1}] [expr {$j+1}]]
    }
  }

  return $list1

}

proc removeIndices { turn i j inList array } {

  upvar $array val
  set outList [list]

  set x 0
  set n [llength $inList]
  while { $x < $n } {

    if { $val([lindex $inList $x],[lindex $inList $x+1]) == 0 || $val([lindex $inList $x],[lindex $inList $x+1]) == $turn } {
      # do not add indices to outList
    } else {
      # add indices to outList
      lappend outList [lindex $inList $x] [lindex $inList $x+1]
    }

    incr x 2

  }
  return $outList
}
    

proc search { turn i0 j0 inList array } {

  upvar $array val
  set outList [list]

  set x 0
  set n [llength $inList]
  set new 1
  while { $x < $n } {

  if { $new == 1 } {

    set i1 [lindex $inList $x]
    set j1 [lindex $inList $x+1]

    set rowDirection [expr {$i1 - $i0}]
    set colDirection [expr {$j1 - $j0}]

    if { $rowDirection == 0 } {
      set i2 $i0
    } elseif { $rowDirection < 0 } {
      set i2 [expr {$i1 - 1}]
    } elseif { $rowDirection > 0 } {
      set i2 [expr {$i1 + 1}]
    }

    if { $colDirection == 0 } {
      set j2 $j0
    } elseif { $colDirection < 0 } {
      set j2 [expr {$j1 - 1}]
    } elseif { $colDirection > 0 } {
      set j2 [expr {$j1 + 1}]
    }

  } else {

    if { $rowDirection == 0 } {
      # don't change i2
    } elseif { $rowDirection < 0 } {
      set i2 [expr {$i2 - 1}]
    } elseif { $rowDirection > 0 } {
      set i2 [expr {$i2 + 1}]
    }

    if { $colDirection == 0 } {
      # don't change j2
    } elseif { $colDirection < 0 } {
      set j2 [expr {$j2 - 1}]
    } elseif { $colDirection > 0 } {
      set j2 [expr {$j2 + 1}]
    }

  }

  if { $i2 < 0 || $j2 < 0 || $i2 > 7 || $j2 > 7 } {
    # check next surrounding index
    incr x 2
    set new 1
  } elseif { $val($i2,$j2) == 0 } {
    # check next surrounding index
    incr x 2
    set new 1
  } elseif { $val($i2,$j2) == $turn } {
    # valid move
    lappend outList $i2 $j2
    incr x 2
    set new 1
  } else {
    # keep searching
    set new 0
  }

  # end while loop
  }

  return $outList

}

proc flipTiles { i0 j0 inList array } {

  upvar $array val
  set outList [list]

  set x 0
  set n [llength $inList]
  while { $x < $n } {

  set i1 [lindex $inList $x]
  set j1 [lindex $inList $x+1]

  set rowDirection [expr {$i1 - $i0}]
  set colDirection [expr {$j1 - $j0}]
  
  if { $rowDirection == 0 } {
    set i2 $i0
  } elseif { $rowDirection < 0 } {
    set i2 [expr {$i0 - 1}]
  } elseif { $rowDirection > 0 } {
    set i2 [expr {$i0 + 1}]
  }
  if { $colDirection == 0 } {
    set j2 $j0
  } elseif { $colDirection < 0 } {
    set j2 [expr {$j0 - 1}]
  } elseif { $colDirection > 0 } {
    set j2 [expr {$j0 + 1}]
  }

  while { $i2 != $i1 || $j2 != $j1 } {

    set val($i2,$j2) [expr {0 - $val($i2,$j2)}]
    if { $rowDirection == 0 } {
      set i2 $i0
    } elseif { $rowDirection < 0 } {
      set i2 [expr {$i2 - 1}]
    } elseif { $rowDirection > 0 } {
      set i2 [expr {$i2 + 1}]
    }
    if { $colDirection == 0 } {
      set j2 $j0
    } elseif { $colDirection < 0 } {
      set j2 [expr {$j2 - 1}]
    } elseif { $colDirection > 0 } {
      set j2 [expr {$j2 + 1}]
    }
  }

  incr x 2

  # end while loop
  }

  return [array get val]

}



proc placeTile { i j array } {

  upvar $array val
  upvar 1 whoseTurn turn

  if { $val($i,$j) != 0 } {
    # do not update turn
    return [array get val]
  } else {
    # continue
  }

  # find indices surrounding i,j
  set surList [surroundingIndices $i $j]
  # remove surrounding indices where value is 0 or turn
  set surList [removeIndices $turn $i $j $surList val]
  # find endpoints where values are not equal to 0 or $val($i,$j)
  set endPoints [search $turn $i $j $surList val]
  # check if move is valid
  if { [llength $endPoints] == 0 } {
    # invalid move
    # do not update turn
  } else {
    # valid move
    # place tile
    set val($i,$j) $turn
    # flip tiles between i,j and endpoints
    array set val [flipTiles $i $j $endPoints val]
    # update turn
    set turn [expr {0 - $turn}]
  }
  # output array
  return [array get val]
}
