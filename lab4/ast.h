#ifndef AST
#define AST

#include <vector>
#include <string>

#include "visitor.h"
using namespace std;

enum Type {ADD, SUB, MULT, DIV, NOT, INT_VAL, MIN, MAX};

/**
 * Base class for all objects that can be placed in the AST
 */
class Root {
public:
  Type type;

  Root(Type type) : type(type) {}
  virtual ~Root() { }

  virtual void accept(Visitor*) = 0;

  void setValue(int n) {
    this->value = n;
  }

  int getValue() {
    return this->value;
  }


protected:
  int value;
};

class BinOp : public Root {
public:
  BinOp(Type type) : Root(type) {};

  virtual void accept(Visitor* v) = 0;

  void setLeft(Root* n) {
    this->left = n;
  }

  Root* getLeft() {
    return this->left;
  }

  void setRight(Root* n) {
    this->right = n;
  }

  Root* getRight() {
    return this->right;
  }

  void setValue(int n) {
    this->value = n;
  }

  int getValue() {
    return this->value;
  }


protected:
  Root* left;
  Root* right;
  int value;
};

class Add : public BinOp {
public:
  Add() : BinOp(ADD) {};
  Add(Root* l, Root* r) : BinOp(ADD) { left= l; right = r; }

  virtual void accept(Visitor* v) {v->visit(this); }
};

class Sub : public BinOp {
public:
  Sub() : BinOp(SUB) {};
  Sub(Root* l, Root* r) : BinOp(SUB) { left= l; right = r; }

  virtual void accept(Visitor* v) {v->visit(this); }
};

class Mult : public BinOp {
public:
  Mult() : BinOp(MULT) {};
  Mult(Root* l, Root* r) : BinOp(MULT) { left= l; right = r; }

  virtual void accept(Visitor* v) {v->visit(this); }
};

class Div : public BinOp {
public:
  Div() : BinOp(DIV) {};
  Div(Root* l, Root* r) : BinOp(DIV) { left= l; right = r; }

  virtual void accept(Visitor* v) {v->visit(this); }
};

/* -------------- UNARY ---------------- */
class UnaryOp : public Root {
public:
  UnaryOp(Type type) : Root(type) { };
  UnaryOp(Type type, Root* child) : Root(type) {
    this->child = child;
  }
  virtual ~UnaryOp() { };

  void set(Root* child) {
    this->child = child;
  }

  Root* get() {
     return child;
  }

  void setValue(int n) {
    this->value = n;
  }

  int getValue() {
    return this->value;
  }

  virtual void accept(Visitor* v) = 0;

protected:
  Root* child;
  int value;
};

class Not : public UnaryOp {
public:
  Not() : UnaryOp(NOT) {};
  Not(Root* child) : UnaryOp(NOT, child) {};

  virtual void accept(Visitor* v) { v->visit(this); }
};

/* ----------------- TRENARY ------------------- */
class TernaryOp : public Root {
public:
  TernaryOp(Type type) : Root(type) {};

  virtual void accept(Visitor* v) = 0;

  void setFirst(Root* n) {
    this->first = n;
  }

  Root* getFirst() {
    return this->first;
  }

  void setSecond(Root* n) {
    this->second = n;
  }

  Root* getSecond() {
    return this->second;
  }

  void setThird(Root* n) {
    this->third = n;
  }

  Root* getThird() {
    return this->third;
  }

  void setValue(int n) {
    this->value = n;
  }

  int getValue() {
    return this->value;
  }

protected:
  Root* first;
  Root* second;
  Root* third;
  int value;
};

/* ------------- TERMINAL ------------- */
class IntegerVal : public Root {
public:
  IntegerVal(int val) : Root(INT_VAL), value(val) { }

  void accept(Visitor* v) { v->visit(this); }

  int getValue() { return value; }

private:
  int value;
};

/* --------------  NARY ----------------- */
class N_Ary : public Root {
public:
    N_Ary(Type type) : Root(type) { };

    void add(Root* child) {
       this->children.push_back(child);
    }

    vector<Root*> getChildren() {
      return children;
    }

    void setValue(int n) {
      this->value = n;
    }

    int getValue() {
      return this->value;
    }

    virtual void accept(Visitor* v) = 0;

  protected:
    vector<Root*> children;
    int value;
};

class Max : public N_Ary {
public:
  Max() : N_Ary(MAX) { };
  Max(vector<Root*> child) : N_Ary(MAX){
    this->children = child;
  }

  virtual void accept(Visitor* v) { v->visit(this); };

};

class Min : public N_Ary {
public:
  Min() : N_Ary(MIN) { };
  Min(vector<Root*> child) : N_Ary(MIN){
    this->children = child;
  }

  virtual void accept(Visitor* v) { v->visit(this); };

};

#endif
