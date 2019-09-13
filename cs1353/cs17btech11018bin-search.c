#include <stdio.h>
//binary search function using recursive calling
int binary_search(int arr[], int element_to_search, int l, int r){
	
	int mid = (r + l)/2;
	if(arr[mid] == element_to_search){
		printf("element is present at index %d",mid);
		return 1;
	}
	else if(arr[mid] < element_to_search){//right iteration
		binary_search(arr,element_to_search, mid , r);
	}
	else{//left iteration
		binary_search(arr,element_to_search, l, mid);
	}
}
int main(){
	int n; //no of element in the array
	scanf("%d",&n);
	int a[n];

	//input of elements in the array
	for(int i = 0; i< n;i++){
		scanf("%d",&a[i]);
	}
	int element_to_search;
	scanf("%d",&element_to_search);
	//search function called
	int search = binary_search(a,element_to_search,0,n);
	if(search != 1)
		printf("Element doesn't exist in array\n");

	return 0;
}