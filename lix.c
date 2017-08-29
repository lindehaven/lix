/*
 * Calculate the readability index of text.
 */

#include <stdio.h>
#include <ctype.h>

#define SIZE_LIM 6

int main( ) {
  float lix=0.0;
  int words=0,long_words=0,sentences=0;
  int c,size;

  while ((c=getchar()) != EOF) {
    if (isalnum(c)) {
      size=1;
      while ((c=getchar()) != EOF && isalnum(c))
        ++size;
      if (size > SIZE_LIM)
        ++long_words;
      else
        ++words;
    }
    if (ispunct(c))
      ++sentences;
  }
  if (sentences==0 || long_words==0 || words==0) {
    printf("Too small file, could not calculate readability index!\n");
    return -1;
  } else {
    lix=(float)long_words*((float)words/(float)sentences+100)/(float)words;
    printf("%.2f ", lix);
    if (lix<30.0)
      printf("(very easy)\n");
    else if (lix<40.0)
      printf("(easy)\n");
    else if (lix<50.0)
      printf("(medium)\n");
    else if (lix<60.0)
      printf("(difficult)\n");
    else
      printf("(very difficult)\n");
    return 0;
  }
}

