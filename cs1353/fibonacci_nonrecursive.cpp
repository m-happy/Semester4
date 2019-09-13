#include <iostream>
using namespace std;
int fibonacci(int n){
	if (n == 0)
		return 0;
	if (n == 1)
		return 1;
	int prev = 0, current = 1;
	for(int i = 2; i < n; i++){
		int new_current = current + prev;
		prev = current;
		current = new_current;
	}
	return current;
}
int main(){
	int n;
	clock_t startTime, endTime;
	cout<<"Enter the no for finding fibonacci : ";
	cin>>n;
	startTime = clock();
	int fib = fibonacci(n);
	endTime = clock();
	cout<<fib<<endl;
	cout<<"time take for "<<n<<"th fibonacci to find is : "<<double(endTime - startTime)/CLOCKS_PER_SEC<<endl;
	return 0;


}