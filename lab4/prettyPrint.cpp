#include <iostream>
#include "visitor.h"
#include "ast.h"

using namespace std;

void PrettyPrint::leadingOps() {
  for(int i = 0; i < depth; i++) {
    cout << "| ";
  }
}

/* ----------  BINARY OPS --------------- */
void PrettyPrint::visit(BinOp* n) {
  leadingOps();
  cout << "+ (BinOp = " << n->getValue() << ")" << endl;

  depth++;
  n->getLeft()->accept(this);
  n->getRight()->accept(this);
  depth--;
}

void PrettyPrint::visit(Add* n) {
  leadingOps();
  cout << "+ (Add = " << n->getValue() << ")" << endl;

  depth++;
  n->getLeft()->accept(this);
  n->getRight()->accept(this);
  depth--;
}

void PrettyPrint::visit(Sub* n) {
  leadingOps();
  cout << "+ (Sub = " << n->getValue() << ")" << endl;

  depth++;
  n->getLeft()->accept(this);
  n->getRight()->accept(this);
  depth--;
}

void PrettyPrint::visit(Mult* n) {
  leadingOps();
  cout << "+ (Mult = " << n->getValue() << ")" << endl;

  depth++;
  n->getLeft()->accept(this);
  n->getRight()->accept(this);
  depth--;
}

void PrettyPrint::visit(Div* n) {
  leadingOps();
  cout << "+ (Div = " << n->getValue() << ")" << endl;

  depth++;
  n->getLeft()->accept(this);
  n->getRight()->accept(this);
  depth--;
}

/* -------------- Unary Ops ------------------ */
void PrettyPrint::visit(UnaryOp* n) {
  leadingOps();
  cout << "+ (UnaryOp = " << n->getValue() << ")" << endl;

  depth++;
  n->get()->accept(this);
  depth--;
}

void PrettyPrint::visit(Not* n) {
  leadingOps();
  cout << "+ (Not = " << n->getValue() << ")" << endl;

  depth++;
  n->get()->accept(this);
  depth--;
}

/* -------------- TERNARY -------------------- */
void PrettyPrint::visit(TernaryOp* n) {
  leadingOps();
  cout << "+ (Ternary = " << n->getValue() << ")" << endl;

  depth++;
  n->getFirst()->accept(this);
  n->getSecond()->accept(this);
  n->getThird()->accept(this);
  depth--;
}

/* ------------- N_ARY Ops ------------------ */
void PrettyPrint::visit(N_Ary* n) {
  leadingOps();
  cout << "+ (N_Ary = " << n->getValue() << ")" << endl;

  depth++;
  for(auto curr : n->getChildren()) {
    curr->accept(this);
  }
  depth--;
}

void PrettyPrint::visit(Max* n) {
  leadingOps();
  cout << "+ (Max = " << n->getValue() << ")" << endl;

  depth++;
  for(auto curr : n->getChildren()) {
    curr->accept(this);
  }
  depth--;
}

void PrettyPrint::visit(Min* n) {
  leadingOps();
  cout << "+ (Min = " << n->getValue() << ")" << endl;

  depth++;
  for(auto curr : n->getChildren()) {
    curr->accept(this);
  }
  depth--;
}

/* ------------- TERMINAL ------------- */
void PrettyPrint::visit(IntegerVal* n) {
  leadingOps();
  cout << "+ (Integer = " << n->getValue() << ")" << endl;
}
