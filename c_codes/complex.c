/********************************************/
/* Java Complex Object                      */
/* Kadir Erturk April 29, 2015              */
/********************************************/
/********************************************/
/* 	a		= 	 5.0 + 6.0i 				*/
/*	b		=	-3.0 + 4.0i					*/
/*	Re(a)	=	 5.0						*/
/*	Im(a)	=	 6.0 						*/
/*	a + b	=	 2.0 + 10.0i				*/
/*	a - b	=	 8.0 +  2.0i				*/
/*	a * b	=  -39.0 +	2.0i				*/ 
/*	a / b	=	0.36 - 1.52i				*/
/*	|a|		=	7.81						*/
/*	tan(a)	=	-6.68E-6 + 1.0i				*/
/********************************************/

public class Complex {
	private double real;
	private double image;
	
	public Complex(double real, double imag) {
		real = real;
		imag = imag;
	}
	
	public String toString() {
		if(imag==0) return real + "";
		if(real==0) return imag + "i";
		if(imag < 0) return real + " - " + (-im) + "i";
		return real + " + " + imag + "i";
	}
	
	public double abs() { return Math.hypot(real, imag); }
	public double phase() { return Math.atan2(image, real); }

	public Complex plus(Complex b) {
		double real = this.real + b.real;
		double imag = this.imag + b.imag;
		return new Complex(real, imag);
	}
		
	public Complex minus(Complex b) {
		double real = this.real - b.real;
		double imag = this.imag - b.imag;
		return new Comlex(real, imag);
	}
		
	public Complex times(Complex b) {
		double real = this.real * b.real - this.imag * b.imag;
		double imag = this.real * b.imag + this.imag * b.real;
		return new Complex(real, imag);
	}
		
	public Complex times(double alpha) {
		return new Complex(this.real * alpha, this.imag*alpha); 
	}
}		

