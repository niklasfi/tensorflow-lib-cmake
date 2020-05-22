#include "tensorflow/cc/saved_model/loader.h"

#include <iostream>

int main(){
    tensorflow::Session *session_ptr_;
    const tensorflow::SessionOptions options{};
    TF_CHECK_OK(tensorflow::NewSession(options, &session_ptr_));

    std::cout << "tensorflow is working" << std::endl;

    TF_CHECK_OK(session_ptr_->Close());
    delete session_ptr_;
}