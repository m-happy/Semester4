#include <stdio.h>
//linear recursive function
int lin_recursive_search(int arr[], int element_to_search, int i,int n){
	if(i < n){
		// printf("1");
		if(arr[i] == element_to_search){
			printf("element_to_search is at index %d",i);
			return 1;
		}
		else{
			i = i + 1;
			lin_recursive_search(arr, element_to_search, i,n);
		}
	}
}
int main(){
	int n;	//no of elements in the array
	printf("Enter the no of elements in the array : ");
	scanf("%d",&n);
	int a[n];
	printf("Enter the elements of array : ");
	for(int i = 0; i< n; i++)	//input for the array
		scanf("%d",&a[i]);
	printf("Enter the element to serach for : ");
	int element_to_search;
	scanf("%d",&element_to_search);
	int search = lin_recursive_search(a,element_to_search,0,n);		//recursive linear function to search for element
	if(search != 1)
		printf("element is not present in array\n");

}