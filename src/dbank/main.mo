import Debug  "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"
actor DBank {
  stable var currentValue:Float=100;
  currentValue := 100;
  stable var startTime : Int = Time.now();
  startTime := Time.now();
  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(currentTime));
  //jhvgcfbv
  
  public func topUp(amount : Float)
  {
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  public func withdraw(amount : Float)
  {
    let tempValue : Float = currentValue - amount;
    if(tempValue>=0)
    {
      currentValue-=amount;
    Debug.print(debug_show(currentValue));
    }
    else
    {
    Debug.print("Not enought balance");
    }
    
  };
   public query func checkBalance(): async Float {
  return currentValue;
   };
   public func compound()
   {
    var currentTime : Int = Time.now();
    var timeElapsed = currentTime - startTime;
    timeElapsed := timeElapsed/1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
    startTime := currentTime;
   }
}
