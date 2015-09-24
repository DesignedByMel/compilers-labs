#include <vector>
#include <string>
#include <math.h>

int yyparse(void);
extern std::vector< std::pair< std::string, double (*)(double) > > FunctionTable;

struct init
{
  char *fname;
  double (*fnct)(double);
};

struct init arith_fncts[]
  = {
	  {"sin", sin},
	  {"cos", cos},
	  {"atan", atan},
	  {"ln", log},
	  {"exp", exp},
	  {"sqrt", sqrt},
	  {0, 0}
    };

int main()
{

	for (int i = 0; arith_fncts[i].fname != 0; i++)
	{
		std::pair< std::string, double (*)(double) > P(arith_fncts[i].fname, arith_fncts[i].fnct);
		FunctionTable.push_back(P);
	}
	yyparse();
	return(0);
}
