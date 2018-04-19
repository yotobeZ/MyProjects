package charactor;

import java.util.List;

import charactor.Smajor;

public class Majornum {
    public int num;
   public List<Smajor> majors;
//  public String[] majors;
   public List<Smajor> getMajors() {
       return majors;
   }
 //public String[] getMajors() {
   //        return majors;
   //    }
  //
 // public void setMajors(String[] majors) {
      //       this.majors = majors;

 // }
    public void setMajors(List<Smajor> majors) {
               this.majors = majors;

    }
    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }
}