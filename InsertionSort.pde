class InsertionSort implements Algorithm {
  Pointer primary = new Pointer(0, color(255, 0, 0));
  Pointer secondary = new Pointer(0, color(0, 0, 255));
  Pointer aux = new Pointer(0, color(0, 0, 255));
  ArrayVisualizer v;
  SqrOsc osci;

  void setup(ArrayVisualizer v, SqrOsc osc){
    this.v = v;
    this.osci = osc;
    
    v.addPointer(primary);
    v.addPointer(secondary);
    v.addPointer(aux);
  }

  int nextIndexToCompare() {
    return secondary.index - 1;
  }

  void moveToNextElement() {
      primary.index++;
      secondary.index = primary.index;
  }
  
  void iterate() {
    if (primary.index >= v.getArraySize()) {
      v.stop();
      return;
    }
    
    aux.index = nextIndexToCompare();
   
    if (aux.index >= 0 && v.getAtPointer(secondary) < v.getAtPointer(aux)) {
      osci.freq(v.getAtPointer(aux));
      v.swapElements(secondary, aux);
      secondary.index = aux.index;
    } else {
      moveToNextElement();
    }
    
  }
  
  void printInfo(){
    text("I eat cheeseburgers sometimes", 0, 20);
    text("Primary: " + primary.index, 0, 30);
    text("Secondary: " + secondary.index, 0, 40);
  }
}
