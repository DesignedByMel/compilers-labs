#include <iostream>
#include "visitor.h"
#include "ast.h"

using namespace std;

/* ----------  BINARY OPS --------------- */
void  PrintExpr::visit(BinOp* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);

}

void  PrintExpr::visit(Add* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  if(n->getLeft()->type == INT_VAL &&  n->getRight()->type == INT_VAL){
     cout << "+ Add : " << n->getLeft()->getValue() << " + " << n->getRight()->getValue() << endl;
  }
}

void  PrintExpr::visit(Sub* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  if(n->getLeft()->type == INT_VAL &&  n->getRight()->type == INT_VAL){
     cout << "+ Sub : " << n->getLeft()->getValue() << " - " << n->getRight()->getValue() << endl;
  }
}

void  PrintExpr::visit(Mult* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  if(n->getLeft()->type == INT_VAL &&  n->getRight()->type == INT_VAL){
     cout << "+ Mult : " << n->getLeft()->getValue() << " * " << n->getRight()->getValue() << endl;
  }
}

void  PrintExpr::visit(Div* n) {

  n->getLeft()->accept(this);
  n->getRight()->accept(this);


  if(n->getLeft()->type == INT_VAL &&  n->getRight()->type == INT_VAL){
     cout << "+ Div : " << n->getLeft()->getValue() << " / " << n->getRight()->getValue() << endl;
  }
}

/* -------------- Unary Ops ------------------ */
void  PrintExpr::visit(UnaryOp* n) {

  n->get()->accept(this);

}

void  PrintExpr::visit(Not* n) {


  n->get()->accept(this);


  if(n->get()->type == INT_VAL){
     cout << "+ Not : " << n->get()->getValue() << endl;
  }
}

/* -------------- TERNARY -------------------- */
void  PrintExpr::visit(TernaryOp* n) {


  n->getFirst()->accept(this);
  n->getSecond()->accept(this);
  n->getThird()->accept(this);


  if(n->getFirst()->type == INT_VAL && n->getSecond()->type == INT_VAL && n->getThird()->type == INT_VAL){
     cout << "+ Trenary : " << n->getFirst()->getValue() << " ? " << n->getSecond()->getValue() << " : " << n->getThird()->getValue() << endl;
  }
}

/* ------------- N_ARY Ops ------------------ */
void  PrintExpr::visit(N_Ary* n) {


  for(auto curr : n->getChildren()) {
    curr->accept(this);
  }

}

void  PrintExpr::visit(Max* n) {

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
    cout << "Max : " << list << endl;;
  }
}

void  PrintExpr::visit(Min* n) {

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
    cout << "Max : " << list << endl;;
  }
}
