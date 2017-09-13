#include <stdio.h>
#include <ctype.h>

/**\brief
 *  Readability Index (LIX) is a measure of how advanced a text is.
 *  Carl-Hugo Bjornsson introduced the method 1968. The LIX number
 *  is calculated using a system where the number of long words and
 *  the number of sentences in the text are weighed with the the
 *  number of words in the whole text like the following:
 *
 *  Formula and parameters:
 *
 *      LIX = W / S + 100 * L / W
 *
 *      W = number of words in the texts
 *      S = number of sentences in the text
 *      L = number of long words (longer than 6 letters)
 *
 *  The formula can thereby be read as "number of words per sentence
 *  added with the percentage of long words in the text". From the
 *  scale below it is possible to evaluate the readability of a text:
 *
 *  | LIX number  | Kind of text                        |
 *  | :---------- | :---------------------------------- |
 *  | Below 25    | Childrens books                     |
 *  | 25 to 30    | Simple texts                        |
 *  | 30 to 40    | Normal texts / fiction              |
 *  | 40 to 50    | Fact texts, for example Wikipedia   |
 *  | 50 to 60    | Fact books / white papers           |
 *  | Above 60    | Difficult facts / research / thesis |
 *
 * \param argc int
 * \param argv[] char*
 * \return LIX number or -1 if too short text
 *
 */
int main(int argc, char* argv[]) {
  float lix=0.0;
  int words=0,long_words=0,sentences=0;
  int c,size;

  while ((c=getchar()) != EOF) {
    if (isalnum(c)) {
      size=1;
      while ((c=getchar()) != EOF && isalnum(c))
        ++size;
      if (size > 6)
        ++long_words;
      else
        ++words;
    }
    if (ispunct(c))
      ++sentences;
  }
  if (sentences==0 || words==0) {
    printf("Too short text!\n");
    return -1;
  } else {
    lix=(float)words/(float)sentences+100.0*(float)long_words/(float)words;
    printf("%.2f ",lix);
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
    return (int)(lix+0.5);
  }
}

