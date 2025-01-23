#include "document.h"
#include "count_vectorization.h"
#include "preprocess.h"
#include <thread>

void do_all(Document * doc) {
    preprocess_text(doc);
    count_words_doc(doc);
    (*doc).calculate_term_frequency_doc();
}

int main() {

    vector<thread> threads;

    Document doc;
    doc.text = "Hello, word Hello";

    // preprocess_text(&doc);
    // count_words_doc(&doc);
    // doc.calculate_term_frequency_doc();

    Document doc1;
    doc.text = "Hello, world and hello cars!";

    // preprocess_text(&doc1);
    // count_words_doc(&doc1);
    // doc.calculate_term_frequency_doc();

    Document doc2;
    doc.text = "That car is quite fast!";

    // preprocess_text(&doc2);
    // count_words_doc(&doc2);
    // doc.calculate_term_frequency_doc();

    Corpus corpus;
    corpus.documents = {doc, doc1, doc2};

    for (auto& d : corpus.documents)
        threads.emplace_back(thread(do_all, &d));
    
    for (auto& t : threads)
        t.join();
    
    cout << corpus.idf_corpus(corpus.num_doc_term("car")) << endl;
    
// 
//     cout << doc.total_terms << endl;
// 
//     for (const auto& [word, count] : doc.term_frequency)
//         cout << word << ": " << count << endl;


    // Corpus corp;
   

    return 0;
}