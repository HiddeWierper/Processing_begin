int steen1 = 0;
int steen2 = 0; 
int steen3 = 0; 
int schade;

if (steen1 == 1 || steen2 == 1 || steen3 == 1){
    println("mis");
}else if(steen1 == 1 && steen2 == 1 && steen3 == 1){
    println("Critical MISS!");
}else if(steen1 == 6 && steen2 == 6 && steen3 == 6){
    println("Gefeliciteerd u heeft 3 keer 6 gegooid");
}else{
    schade = steen1 + steen2 + steen3 / 3;
    println(schade + " HIT!");
}


for (int i = 20; i >=0; i = i-2){
    println(i);
}