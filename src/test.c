#include "test.h"

struct dc_descriptor_t {
	const char *testStr;
};

void get_string(void* data) {
    data = "Hello World!!!";
}