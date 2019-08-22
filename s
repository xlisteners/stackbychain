#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int a;
    struct node * next;
}node;

typedef node* stack;

stack build()
{
    stack c = (node*)malloc(sizeof(node));
    c->next = NULL;
    return c;
}

int isempty(stack a)
{
    if(a->next == NULL)return 1;
    else return 0;
}

int pop(stack x)
{
    int b;
    stack temp;
    if(isempty(x)){
        printf("栈空");
        return -1;
    }
    else{
        temp = x->next;
        b = temp->a;
        x->next = temp->next;
        free(temp);
        return b;
    }
}

void empty(stack x)
{
    while(!isempty(x))
    {
        pop(x);
    }
}

void push(stack y,int x)
{
    stack temp = (node *)malloc(sizeof(node));
    temp->a = x;
    temp->next = y->next;
    y->next = temp;
}

int top(stack x)
{
    if(isempty(x))return -1;
    else{
        return x->next->a;
    }
}


int main()
{
    stack stack1 = build();
    printf("StackTopElement =  %d \n",top(stack1));
    push(stack1,5);
    printf("StackTopElement =  %d \n",top(stack1));
    push(stack1,6);
    printf("StackTopElement =  %d \n",top(stack1));
    push(stack1,7);
    printf("StackTopElement =  %d \n",top(stack1));
    pop(stack1);
    printf("StackTopElement =  %d \n",top(stack1));
    empty(stack1);
    printf("StackTopElement =  %d \n",top(stack1));
    return 0;
}
