/* ========================================
 *
 * Brendan Behrens
 * Embedded Systems: ELC 411-01
 * 9/3/2017
 *
 * ========================================
*/

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdint.h>

//A bubblesort function that will be used on my character array
void bubbleSort(char arr[], int length) {
    for(int i = 0; i < length; i++){
        for(int j = 0; j < i;j++){
            if(arr[i] > arr[i+1]){
                char temp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = temp;
            }
        }
    }
}

int main(void)
{
    uint32_t implementer;
    uint32_t variant;
    uint32_t partno;
    uint32_t revision;
    uint32_t reg_val;

    char myname[]= "Brendan Behrens";

    //4.1 Accessing registers via their address

    #define NVIC_CPUID_BASE_ADDR(0xe000ed00);
    //Accessing the register value
    uint32_t volatile * my_reg_ptr;
    my_reg_ptr = (uint32_t *) NVIC_CPUID_BASE_ADDR;
    reg_val = *my_reg_ptr;

    //Assign the proper bits to their memory adresses and replacing the bits to the right with 0s
    implementer = (reg_val >> 24) & 0x18;
    variant = (reg_val >> 20)  & 0x14;
    partno = (reg_val >> 4) & 0x4;
    revision = reg_val;

    //4.2 Manipulating a character String
    int length = sizeof(myname);

    //Run the bubble sort function on my name
    bubbleSort(myname, length);
    printf(myname);

    //Infinite for-loop
    for(;;)
    {
    }
}