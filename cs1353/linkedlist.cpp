#include <iostream>
using namespace std;
//struct for the node
struct Node {
	int value;
	struct Node* next;
};
//insert function to insert in the linked list
struct Node* insert(struct Node* node, int value){
	struct Node* newNode = (struct Node* )malloc(sizeof(struct Node)); //memory allocation for new node
	newNode->value = value;
	if(node == NULL){		//check if the node is fist node
		node = newNode;
		return node;
	}
	struct Node* temp = node;  //else traverse to the end the add in the list
	while(temp->next != NULL)
		temp = temp->next;
	temp->next = newNode;
	return node;

}
//function to printing the list
void PrintNodes(struct Node* node){
	struct Node* temp = node;
	while(temp != NULL){
		cout<<temp->value;
		cout<<"\t";
		temp = temp->next;
	}
}
//function to find the minimum element of the list
int minimum(struct Node* node){
	int min = node->value; //minimum initilization
	struct Node* temp = node;
	while(temp != NULL){			//traversion and finding the minimum elements
		if(min > temp->value)
			min = temp->value;
		temp = temp->next;
	}
	return min;
}
//function for finding the mean then finding the first element greater the mean
int summation(struct Node* node){
	int sum = 0; //for sum
	int a = 0; //for no of element in the list
	struct Node* temp = node;
	//finding the sum and calculating the no of elements in the list
	while(temp != NULL){
		sum += temp->value;
		temp = temp->next;
		a++;
	}
	int mean = sum/a;
	temp = node;
	int element = node->value;
	//finding the first element greater than mean
	while(temp != NULL){
		if(temp->value > mean){
			element = temp->value;		
			break;
		}
		temp = temp->next;
	}
	return element;
}
//Driver funtioni
int main(){
	struct Node* head = NULL; //head of the list node
	int n;
	int min = 0;
	bool flag = true;
	//input till the input element is negative
	while(flag){
		cin>>n;
		if(n > 0){
			// if(min > n)
			// 	min = n;
			head = insert(head, n); //insertion int the list
		}
		else
			flag = false;
	}
	cout<<"The linked list is : ";
	PrintNodes(head); //linked ist
	cout<<"\n";
	// int mean = summation(head);
	// cout<<"The mean of the list is : "<<mean; 
	cout<<"The min element of the list is : "<<minimum(head)<<endl; //min element
	cout<<"The first element in linked list greater than  mean is : "<<summation(head)<<endl; //first element
																							//greater than mean

	return 0;


}