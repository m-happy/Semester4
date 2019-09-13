#include <stdio.h>
int main(){
	int n;
	printf("Enter the no of element in the array : ");
	scanf("%d",&n);
	int a[n];
	printf("Enter the element of the array : ");
	for(int i = 0; i < n;i++)
		scanf("%d",&a[i]);
	int element_to_search;
	printf("Enter the element to search for : ");
	scanf("%d",&element_to_search);
	int left = 0;
	int flag = 0; 
	int right = n;
	while(left < right){
		int mid = (left + right)/2;
		if(a[mid] == element_to_search){
			printf("element_to_search is at index %d",mid);
			flag = 1;
			break;
		}
		else if(a[mid] < element_to_search){
			left = mid;
		}
		else{
			right = mid;
		}
	}
	if(flag == 0)
		printf("no is not present in the array\n");
}