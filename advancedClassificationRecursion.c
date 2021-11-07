#include <math.h>
#include "NumClass.h"

int myPowRecursive(int base,int ex){
	if(ex == 0) return 1;
	return base*myPowRecursive(base,ex-1);
}

int isArmstrong(int a){
	int num = (int)log10(a) + 1; // number of digits in pali
	int sum =0; 
	for(int i=0; i<num;i++){
		int d= myPowRecursive(10,i);
		int t= (a/d)%10;  // the i'th digit
		sum = sum + myPowRecursive(t,num);	
	}
	if(sum == a) return true;
	return false;
	
}

  int reverse(int r){
	 int numberOfDigit = (int)log10(r) + 1; // number of digits in pali
     int power = (int)pow(10,numberOfDigit-1);
     int last = r % 10;
     if(numberOfDigit == 1) return r;
	 return last* power + reverse((r - last) / 10);
  }
  
  int isPalindrome(int pali){
	 if( pali == reverse(pali))return true;
	 return false;
	 } 
  
