#ifndef VISTOR_PATTERN
#define VISTOR_PATTERN

class Root;
class BinOp;
class Add;
class Sub;
class Mult;
class Div;
class UnaryOp;
class Not;
class TernaryOp;
class IntegerVal;
class N_Ary;
class Min;
class Max;

class Visitor {
public:
  Visitor() {};
  virtual ~Visitor() {};

  virtual void visit(BinOp*) = 0;
  virtual void visit(Add*) = 0;
  virtual void visit(Sub*) = 0;
  virtual void visit(Mult*) = 0;
  virtual void visit(Div*) = 0;

  virtual void visit(UnaryOp*) = 0;
  virtual void visit(Not*) = 0;

  virtual void visit(TernaryOp*) = 0;

  virtual void visit(IntegerVal*) = 0;

  virtual void visit(N_Ary*) = 0;
  virtual void visit(Min*) = 0;
  virtual void visit(Max*) = 0;


};

class PrettyPrint : public Visitor {
public:
  PrettyPrint() : depth(0) {};

  void visit(BinOp*);
  void visit(Add*);
  void visit(Sub*);
  void visit(Div*);
  void visit(Mult*);

  void visit(UnaryOp*);
  void visit(Not*);

  void visit(TernaryOp*);
  void visit(IntegerVal*);

  void visit(N_Ary*);
  void visit(Min*);
  void visit(Max*);

private:
  int depth;          // level in the tree this node is at
  void leadingOps();  // This prints line tabbed in based on the depth of the node in the tree
};

class PrintExpr : public Visitor {
public:
  PrintExpr() {};

  void visit(BinOp*);
  void visit(Add*);
  void visit(Sub*);
  void visit(Div*);
  void visit(Mult*);

  void visit(UnaryOp*);
  void visit(Not*);

  void visit(TernaryOp*);
  void visit(IntegerVal*);

  void visit(N_Ary*);
  void visit(Min*);
  void visit(Max*);

};

class Eval : public Visitor {
public:
  Eval() {};

  void visit(BinOp*);
  void visit(Add*);
  void visit(Sub*);
  void visit(Div*);
  void visit(Mult*);

  void visit(UnaryOp*);
  void visit(Not*);

  void visit(TernaryOp*);
  void visit(IntegerVal*);

  void visit(N_Ary*);
  void visit(Min*);
  void visit(Max*);

};

#endif
