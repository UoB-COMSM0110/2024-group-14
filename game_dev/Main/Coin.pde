public class Coin{
  private double xPosition, yPosition;
  
  public Coin(double xPosition, double yPosition){
   setXPosition(xPosition);
   setYPosition(yPosition);
  }
  
  public double getXPosition(){
    return this.xPosition;
  }
  
  public double getYPosition(){
    return this.yPosition;
  }
  
  public void setXPosition(double xPosition){
    // TODO set bounds checking 
    this.xPosition = xPosition;
  }
  
  public void setYPosition(double yPosition){
    // TODO set bounds checking 
    this.yPosition = yPosition;
  }
  
}
