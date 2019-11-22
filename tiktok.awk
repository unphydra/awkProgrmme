BEGIN{
  pic_x="X"
  pic_o="O"
  count=0
  p_count=0
  structure_in()
  players_turn()
  structure_print()
}

{
 if(check_if_valid()==0) {
    next;
  }
}

{
  if(players_turn()==1) {
    if(check_if_already_ocupied()==1) {
      next;
    }else {
      arr[$0]=pic_x
      structure_print()
      next;
    }
  }
  if(players_turn()==0) {
    if(check_if_already_ocupied()==1) {
      next;
    }else {
      arr[$0]=pic_o
      structure_print()
      next;
    }
  }
}

function win_count() {
  return((win_check(arr[1],arr[2],arr[3]))||(win_check(arr[4],arr[5],arr[6]))||(win_check(arr[7],arr[8],arr[9]))||(win_check(arr[1],arr[4],arr[7]))||(win_check(arr[2],arr[5],arr[8]))||(win_check(arr[3],arr[6],arr[9]))||(win_check(arr[1],arr[5],arr[9]))||(win_check(arr[3],arr[5],arr[7])))
}
function structure_in() {
  for(i=1;i<10;i++) {
    count++
    arr[i]=count
  }
}

function structure_print() {
  print "|---+---+---|"
  for(i=1;i<4;i++) {
    print"| "arr[p_count+1]" | "arr[p_count+2]" | "arr[p_count+3]" |"
    p_count=p_count+3
  print "|---+---+---|"
  }
  p_count=0
  if(win_count()==1) {
    if(arr[$0]==pic_x) {
      print "players 1 win the match!"
      exit
    }else {
      print "players 2 win the match!"
    }
  }
  if(players_turn()==0) {
    print "\nplayers 1 turn\n"
  } else {
  print"\nplayers 2 turn\n"
  }
}

function players_turn() {
  if(NR==0||NR%2==0) {
  return 0;
  }
  return 1;
}

function check_if_valid() {
  if(!($0>0&&$0<10)) {
    print "\ninvalid input\n"
    NR--
    players_turn()
    structure_print()
    return 0;
  } else {
  return 1;
  }
}

function check_if_already_ocupied() {
  if(!(arr[$0]~/^[0-9]/)) {
    print "\nalready ocupied\n"
    NR--
    players_turn()
    structure_print()
    return 1;
  } else {
  return 0;
  }
}

function win_check(pos_1,pos_2,pos_3) {
  return((pos_1==pos_2)&&(pos_1==pos_3)) 
}



