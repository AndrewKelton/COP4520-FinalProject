#include <iostream>
#include <vector>
#include <unordered_map>
#include <string>

using namespace std;

// class for single document
class Document {
    public:
        string text;                                  // overall text of document
        unordered_map<string, int> term_count;        // count of terms in document
        unordered_map<string, double> term_frequency; // frequency of terms in document
        int total_terms;                              // total number of terms in document

        // return term frequency associated with a word in a doc
        double calculate_term_frequency(string term) {
            return term_count[term] / total_terms;
        }

        // other functions here

};

// class for entire corpus (collection of documents)
class Corpus {
    public:
        vector<Document> documents; // list of documents
        int num_of_docs;            // total number of documents

        // inverse document frequency calculation
        double idf_corpus(int docs_with_term) {
            return log(num_of_docs / docs_with_term);
        }

};