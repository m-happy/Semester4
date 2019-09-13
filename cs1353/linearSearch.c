#include <stdio.h>
int main(){
	int n;
	// printf("Enter the no of elements in the array : " );
	scanf("%d",&n);
	int a[n];
	// printf("Enter the %d no in arrray: \n",n);
	for(int i = 0; i < n;i++){
		scanf("%d",&a[i]);
	}
	int element_to_search;
	int flag = 0;
	scanf("%d",&element_to_search);
	for(int i = 0; i< n ;i++){
		if(a[i] == element_to_search){
			printf("index of element_to_search is %d\n",i );
			flag = 1;
			break;
		}
	}
	if(flag == 0)
		printf("Element is not present in the array");
	return 0;
}