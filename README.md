# Readability Index

## Background

Readability Index (LIX) is a measure of how advanced a text is.
Carl-Hugo Bjornsson introduced the method 1968. The LIX number
is calculated using a system where the number of long words and
the number of sentences in the text are weighed with the number
of words in the whole text.

## Formula and parameters

    LIX = W / S + 100 * L / W

    W = number of words in the texts
    S = number of sentences in the text
    L = number of long words (longer than 6 letters)

The formula can thereby be read as "number of words per sentence
added with the percentage of long words in the text".

## Readability index scale

From the scale below it is possible to evaluate the readability
of a text:

    | LIX number  | Kind of text                        |
    | :---------- | :---------------------------------- |
    | Below 25    | Childrens books                     |
    | 25 to 30    | Simple texts                        |
    | 30 to 40    | Normal texts / fiction              |
    | 40 to 50    | Fact texts, for example Wikipedia   |
    | 50 to 60    | Fact books / white papers           |
    | Above 60    | Difficult facts / research / thesis |
