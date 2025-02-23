#ifndef COUNT_VECTORIZATION_H
#define COUNT_VECTORIZATION_H

#include <string>
#include <iostream>
#include <vector>
#include <map>
#include <tuple>
#include <set>
#include <thread>
// #include <mutex>
#include <sstream>
#include "document.h"
#include "preprocess.h"
#include "categories.h"

using namespace std;

// vectorize corpus of documents simultaneously
extern void vectorize_corpus_threaded(Corpus * corpus);

// vectorize corpus of documents simultaneously, based on category
// extern void vectorize_corpus_category_threaded(Corpus * corpus, int category);

extern void vectorize_corpus_sequential(Corpus * corpus);

#endif