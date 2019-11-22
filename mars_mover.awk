BEGIN{
  vir=5
  hor=1
  dir=0
  draw(vir,hor,dir)
}

!($0>=0 && $0<=2) {
  print "\n\n""not a valid input""\n\n"
}

{
  vir_prev=vir
  hor_prev=hor
  dir_prev=dir
}

{
  which_dir()
  where_to_go()
}

(vir<1||vir>5||hor<1||hor>5) {
  vir=vir_prev
  hor=hor_prev
  dir=dir_prev
  print"you cant go outside the map"
}

draw(vir,hor,dir)

function draw(vir,hor,dir) {
 {
 look[0]="▲"
 look[1]="▶︎"
 look[2]="▼"
 look[3]="◀︎"
 }
  for(i=1;i<6;i++){
   print "-----------"
   for(j=1;j<6;j++){
     a[i,j]=" "
   }
   a[vir,hor]=look[dir]
   print "|"a[i,1]"|"a[i,2]"|"a[i,3]"|"a[i,4]"|"a[i,5]"|"
 }
  print "-----------"
  print "\n\n""Enter 0 for move forward, Enter 2 for turn right, Enter 1 for turn left""\n"
}

function which_dir() {

  if($0==2&&dir<=3) {
    dir++
  }

  if($0==2&&dir==4) {
    dir=0
  }

  if($0==1&&dir>=0) {
    dir--
  }

  if($0==1&&dir==-1) {
    dir=3
  }
return dir
}

function where_to_go() {

  if($0==0&&dir==0) {
    vir--
  }

  if($0==0&&dir==1) {
    hor++
  }

  if($0==0&&dir==2) {
    vir++
  }

  if($0==0&&dir==3) {
    hor--
  }
return vir hor
}
