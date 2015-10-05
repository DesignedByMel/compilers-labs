#include <iostream>
#include <string>
using namespace std;

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#include "ast.h"
#include "visitor.h"

int main(int argc, char** argv)
{

  Add* tree = new Add(new Mult(new IntegerVal(2), new Div(new IntegerVal(2), new IntegerVal(1))), new Sub( new IntegerVal(5), new IntegerVal(2)));

  cout << "Pretty Print the tree" << endl;
  tree->accept(new Eval());
  tree->accept(new PrettyPrint());

  cout << "Print only expressions with integers as children" << endl;
  tree->accept(new PrintExpr());
  return 0;
}
