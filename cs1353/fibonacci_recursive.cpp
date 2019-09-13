#include <iostream>
#include <time.h>
using namespace std;
//fibnonacci for finding the fibonacci of number
int fibonacci(int n){
	if(n == 1)
		return 0;
	else if(n == 2 || n == 3)
		return 1;
	else
		return fibonacci(n - 1) + fibonacci(n - 2);
}
//Driver function
int main(){
	int n;	//no to find the 
	clock_t startTime, endTime;
	cout<<"Enter the no to find fibonacci : ";
	cin>>n;
	startTime = clock();
	int fib = fibonacci(n);
	endTime = clock();
	cout<<fib<<endl;
	cout<<"time take for "<<n<<"th fibonacci to find is : "<<double(endTime - startTime)/CLOCKS_PER_SEC<<endl;
	return 0;

}