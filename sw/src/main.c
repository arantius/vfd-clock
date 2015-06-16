#include <stdio.h>
#include <stdlib.h>
#include "diag/Trace.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wmissing-declarations"
#pragma GCC diagnostic ignored "-Wreturn-type"


int main(int argc, char* argv[]) {
  trace_puts("VfdClock main() init.");
  while (1) { }
}


#pragma GCC diagnostic pop
