#include "test.h"
#include <string.h> 
#include <stdlib.h>

struct dc_descriptor_t {
	const char *testStr;
};

void get_string(void* data) {
    char *str = (char *)malloc(sizeof(char) * 12); // 11 characters + 1 for '\0'
    if (!str) {
        // handle error
    }
    strcpy(str, "Hello World");
    str[11] = '\0'; // Null-terminate the string
    ((struct dc_descriptor_t*)data)->testStr = str;
}