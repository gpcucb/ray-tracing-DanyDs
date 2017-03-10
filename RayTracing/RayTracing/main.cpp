#include "RGB.h"
#include "Vector.h"
#include "Rayo.h"
#include "Camara.h"

float nx = 640.0;
float ny = 480.0; 
Vector e(1,2,-6);
Vector center(1,2,-4);
Vector up(0,1,0);
float fov = 39.0;
float df = 1.0;

int main(){
	Camara camera(e, center, up, fov, df);
	Vector dir;
	for(float i=0; i<=nx;i++){
		for(float j=0;j<=ny;j++){
			dir = camera.direccionRayo(i,j,nx,ny);
			dir.show();
		}
	}
	return 0;
}