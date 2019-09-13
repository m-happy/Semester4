#include <iostream>
#include <time.h>
using namespace std;
//linearSearch for searching in till the last element.
int linearSearch(int arr[], int n, int searchKey){
	int j = -1;
	for(int i = 0; i < n; i++){
		if(arr[i] == searchKey){
			j = i;
		}
	}
}
int main(){
	clock_t startTime, endTime;	//startTime and endtime
	int MAX = 100000;
	srand(time(0));
	int arr[MAX];
	cout<<" Size \t running time\n";
	for(int i = 10; i<= 100000; i = i * 10){
		for(int j = 0; j < i; j++){
			arr[j] = rand();
		}
		int searchKey = rand();
		startTime = clock();		//clock starts
		linearSearch(arr, i, searchKey);
		endTime = clock();			//clock ends
		cout<<i<<"\t"<<(double)(endTime - startTime)/CLOCKS_PER_SEC<<endl; //calculatese time
	}

	return 0;
}