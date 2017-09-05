/*

    K�lla https://sv.wikipedia.org/wiki/L%C3%A4sbarhetsindex

    L�sbarhetsindex (LIX) som �r ett m�tt p� hur avancerad en text �r.
    Carl-Hugo Bj�rnsson introducerade metoden 1968. LIX-talet ber�knas
    efter ett system d�r antalet l�nga ord och antalet meningar i texten
    viktas mot antalet ord i hela texten p� f�ljande s�tt:

    Parametrar:
        O = antal ord i texten
        M = antal meningar i texten
        L = antal l�nga ord (�ver 6 bokst�ver l�nga)

      LIX = O / M + 100 * L / O

    Formeln kan allts� f�rst�s som antal ord per mening, adderat med
    procentdelen av l�nga ord i texten. Utifr�n f�ljande skala kan man
    v�rdera l�sbarheten i en text:

    LIX-tal f�r texter av olika slag:
    Under 25    Barnb�cker.
    25 till 30  Enkla texter.
    30 till 40  Normaltext / sk�nlitteratur.
    40 till 50  Sakinformation, till exempel Wikipedia.
    50 till 60  Facktexter.
    �ver 60	    Sv�ra facktexter / forskning / avhandlingar.

 */

#include <stdio.h>
#include <ctype.h>

int main( ) {
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

