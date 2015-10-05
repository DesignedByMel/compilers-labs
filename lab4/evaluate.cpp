
#include <iostream>
#include "visitor.h"
#include "ast.h"

using namespace std;

/* ----------  BINARY OPS --------------- */
void Eval::visit(BinOp* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);

}

void Eval::visit(Add* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  n->setValue(n->getLeft()->getValue()  + n->getRight()->getValue());
}

void Eval::visit(Sub* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  n->setValue(n->getLeft()->getValue()  - n->getRight()->getValue());
}

void Eval::visit(Mult* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  n->setValue(n->getLeft()->getValue()  * n->getRight()->getValue());
}

void Eval::visit(Div* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  n->setValue(n->getLeft()->getValue()  / n->getRight()->getValue());
}

/* -------------- Unary Ops ------------------ */
void Eval::visit(UnaryOp* n) {

  n->get()->accept(this);

}

void Eval::visit(Not* n) {


  n->get()->accept(this);


  n->setValue(!n->getValue());
}

/* -------------- TERNARY -------------------- */
void Eval::visit(TernaryOp* n) {


  n->getFirst()->accept(this);
  n->getSecond()->accept(this);
  n->getThird()->accept(this);


  n->setValue(n->getFirst()->getValue() ? n->getSecond()->getValue() : n->getThird()->getValue() );
}

/* ------------- N_ARY Ops ------------------ */
void Eval::visit(N_Ary* n) {


  for(auto curr : n->getChildren()) {
    curr->accept(this);
  }

}

void Eval::visit(Max* n) {

  string list;


  for(auto curr : n->getChildren()) {
    curr->accept(this);
  }


}

void Eval::visit(Min* n) {

  string list;


  for(auto curr : n->getChildren()) {
    curr->accept(this);
  }


  for(auto curr : n->getChildren()) {
      if(curr->type == INT_VAL){
        list += " " + curr->getValue();
      }
  }

  if(list.size() > 0){
    cout << "Max : " << list << endl;
  }
}
