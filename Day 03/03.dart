
void main()
{
  MyInfo me = MyInfo(name : "salah hassan" , age :20 , phone: "+20114451251" , country : "Egypt"  , job : "no job") ; 
  me.show() ;
 
}
class MyInfo
{
    String name ; 
    int age ; 
    String phone ; 
    String country ; 
    String job ; 

  MyInfo({required this.name ,required this.age ,required this.phone ,required this.country ,required this.job  }) ; 

  void show()
{ 
  print("name : $name") ;
  print("age : $age") ;
  print("phone : $phone") ;
  print("country : $country") ;
  print("job : $job") ;

}
    
 
}

