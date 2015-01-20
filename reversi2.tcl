package require Tk

source reversiProcs2.tcl
source updateColors.tcl
source updateTurn.tcl

#### Set up 8x8 reversi grid

set i 0
while { $i < 8 } {
  set j 0
  while { $j < 8 } {
    set value($i,$j) 0
    incr j
  }
  incr i
}

set value(3,3) 1
set value(3,4) -1
set value(4,3) -1
set value(4,4) 1

set whiteScore 2
set blackScore 2

set whoseTurn 1

# Create 1 game board to contain 8x8 grid
frame .board -width 200 -height 20 -relief solid -borderwidth 2

# Create 8x8 grid in box
set i 0
while {$i < 8} {
  set j 0
  while {$j < 8} {
    entry .board.square$i$j -textvariable value($i,$j) -width 3 -justify center -bg lightblue -highlightbackground blue -show " "
    grid .board.square$i$j -row $i -column $j -ipady 5
    incr j
  }
  incr i
}

bind .board.square00 <Button-1> { placeTile 0 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square01 <Button-1> { placeTile 0 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square02 <Button-1> { placeTile 0 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square03 <Button-1> { placeTile 0 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square04 <Button-1> { placeTile 0 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square05 <Button-1> { placeTile 0 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square06 <Button-1> { placeTile 0 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square07 <Button-1> { placeTile 0 7 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square10 <Button-1> { placeTile 1 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square11 <Button-1> { placeTile 1 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square12 <Button-1> { placeTile 1 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square13 <Button-1> { placeTile 1 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square14 <Button-1> { placeTile 1 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square15 <Button-1> { placeTile 1 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square16 <Button-1> { placeTile 1 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square17 <Button-1> { placeTile 1 7 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square20 <Button-1> { placeTile 2 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square21 <Button-1> { placeTile 2 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square22 <Button-1> { placeTile 2 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square23 <Button-1> { placeTile 2 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square24 <Button-1> { placeTile 2 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square25 <Button-1> { placeTile 2 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square26 <Button-1> { placeTile 2 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square27 <Button-1> { placeTile 2 7 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square30 <Button-1> { placeTile 3 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square31 <Button-1> { placeTile 3 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square32 <Button-1> { placeTile 3 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square33 <Button-1> { placeTile 3 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square34 <Button-1> { placeTile 3 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square35 <Button-1> { placeTile 3 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square36 <Button-1> { placeTile 3 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square37 <Button-1> { placeTile 3 7 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square40 <Button-1> { placeTile 4 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square41 <Button-1> { placeTile 4 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square42 <Button-1> { placeTile 4 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square43 <Button-1> { placeTile 4 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square44 <Button-1> { placeTile 4 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square45 <Button-1> { placeTile 4 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square46 <Button-1> { placeTile 4 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square47 <Button-1> { placeTile 4 7 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square50 <Button-1> { placeTile 5 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square51 <Button-1> { placeTile 5 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square52 <Button-1> { placeTile 5 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square53 <Button-1> { placeTile 5 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square54 <Button-1> { placeTile 5 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square55 <Button-1> { placeTile 5 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square56 <Button-1> { placeTile 5 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square57 <Button-1> { placeTile 5 7 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square60 <Button-1> { placeTile 6 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square61 <Button-1> { placeTile 6 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square62 <Button-1> { placeTile 6 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square63 <Button-1> { placeTile 6 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square64 <Button-1> { placeTile 6 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square65 <Button-1> { placeTile 6 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square66 <Button-1> { placeTile 6 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square67 <Button-1> { placeTile 6 7 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square70 <Button-1> { placeTile 7 0 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square71 <Button-1> { placeTile 7 1 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square72 <Button-1> { placeTile 7 2 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square73 <Button-1> { placeTile 7 3 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square74 <Button-1> { placeTile 7 4 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square75 <Button-1> { placeTile 7 5 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square76 <Button-1> { placeTile 7 6 value ; updateTurn value ; updateColors value $whoseTurn }
bind .board.square77 <Button-1> { placeTile 7 7 value ; updateTurn value ; updateColors value $whoseTurn }

pack .board -side top

frame .console -height 500 -bg blue -relief solid -borderwidth 2

button .reset -text "Reset" -highlightbackground blue -command reset

button .pass -text "Pass" -highlightbackground blue -command {
  set whoseTurn [expr {0 - $whoseTurn}]
  updateColors value $whoseTurn
}
# replace pass with available moves proc

entry .displayWhiteScore -textvariable whiteScore -state disabled -width 2 -highlightbackground white -justify center -bd 2 -disabledforeground black
entry .displayBlackScore -textvariable blackScore -state disabled -width 2 -highlightbackground black -justify center -bd 2 -disabledforeground black

entry .displayTurn -textvariable whoseTurn -state disabled -width 2 -disabledbackground white -highlightbackground blue -show " "
pack .console -fill x
pack .reset .pass -in .console -side left
pack .displayTurn .displayBlackScore .displayWhiteScore -in .console -side right

.board.square33 configure -bg white
.board.square34 configure -bg black
.board.square43 configure -bg black
.board.square44 configure -bg white



