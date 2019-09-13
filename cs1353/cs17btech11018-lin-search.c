#include <stdio.h>
int main(){
	int n; //no of elements in the arrray
	scanf("%d",&n);
	int a[n];
	// input taken
	for(int i = 0; i < n;i++){
		scanf("%d",&a[i]);
	}
	int element_to_search;
	int flag = 0;
	scanf("%d",&element_to_search);
	//iteration to find the element to seach for
	for(int i = 0; i< n ;i++){
		if(a[i] == element_to_search){
			printf("element is present at index %d\n",i );
			flag = 1;
			break;
		}
	}
	//if element in not present in the arrray
	if(flag == 0)
		printf("Element is not present in the array");
	return 0;
}