#!/etc/profiles/per-user/ro/bin/scriptisto

// scriptisto-begin
// script_src: script.c
// build_cmd: clang -O3 script.c -o ./script
// scriptisto-end

#include <stdio.h>
int main() {
  printf("Hello scriptisto\n");
  return 0;
}
