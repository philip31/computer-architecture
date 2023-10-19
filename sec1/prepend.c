#include <stdio.h>

struct ll_node {
    struct ll_node* next;
    int value;
};

void prepend(struct ll_node** list, int value)
{
    struct ll_node* pnode = (struct ll_node*) malloc(sizeof(struct ll_node));
    pnode->next = NULL;
    pnode->value = value;

    if (*list != NULL)
        pnode->next = (*list)->next;

    *list = pnode;
}

void free_ll(struct ll_node** list)
{
    if(*list != NULL)
    {
        free_ll(&(*list)->next);
        free(*list);
    }    
}

int main()
{
    struct ll_node root = {NULL, 0};
    prepend(&root.next, 1);

    printf("root value: %d\n", root.value);
    printf("first value: %d\n", root.next->value);

    free_ll(&root.next);

    printf("root value: %d\n", root.value);
    printf("first value: %d\n", root.next->value);
}