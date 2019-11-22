BEGIN{
  a[1]="rock"
  a[2]="paper"
  a[3]="sessior"
  print "\n\n"" give input | 1 for rock , 2 for paper , 3 for sessior"
}

($0<1||$0>3){
  print "hey! you have given wrong input";
  next
}

{srand()
  num=(int(rand*2.99))
}

($0==num){
  print "you have chosen " a[$0]
  print "Bot has chosen " a[num]
  print "\n""match draw!"
  next
}

(($0==1&&num==2)||($0==2&&num=3)||($0==3&&num==1)){
  print "Bot has chosen " a[num]
  print "You have chosen " a[$0]
  print "\n""Bot has won!"
  print "\n\n"" give input | 1 for rock , 2 for paper , 3 for sessior"
  next
}

(($0==1&&num==3)||($0==2&&num==1)||($0==3&&num==2)){
  print "Bot has chosen " a[num]
  print "You have chosen " a[$0]
  print "\n""You have won!"
  print "\n\n"" give input | 1 for rock , 2 for paper , 3 for sessior"
  next
}
