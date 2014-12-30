#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "gp5util.h"

void pg5_set_xscale(double);

int main(){
	enum{
		N = 4,
	};
	static double pos[N][3];
	static double mas[N];
	static double acc[N][3];
	static double pot[N];

	int i;
	const double s = 1.0;
	for(i=0; i<N; i++){
		pos[i][0] = s * drand48();
		pos[i][1] = s * drand48();
		pos[i][2] = s * drand48();
		mas[i] = 1.0 / N;
	}

	g5_open();
	/// pg5_set_xscale(1.0);
	g5_set_n(N);
	g5_set_xmj(0, N, pos, mas);
	g5_calculate_force_on_x(pos, acc, pot, N);
	g5_close();

	for(i=0; i<N; i++){
		printf("%d : (%e, %e, %e), %e\n",
				i, acc[i][0], acc[i][1], acc[i][2], pot[i]);
	}

	return 0;
}
