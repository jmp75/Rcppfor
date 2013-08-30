
#include <Rcpp.h>

extern "C" {
	void myfortsub(char * text);
	//char * myfortfunction(); 
};


using namespace Rcpp;

// [[Rcpp::export]]
List rcpp_hello_world() {
   
	 CharacterVector x = CharacterVector::create( "foo", "bar" )  ;

    //CharacterVector x = CharacterVector::create( myfortfunction() )  ;
    NumericVector y   = NumericVector::create( 0.0, 1.0 ) ;
    List z            = List::create( x, y ) ;
    
    return z ;
}
