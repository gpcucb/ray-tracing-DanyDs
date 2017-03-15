#include "RGB.h"
#include "Vector.h"
#include "Rayo.h"
#include "Camara.h"
#include "Esfera.h"


int main(){

	float nx = 640.0;
float ny = 480.0; 
// Valores de la cámara
Vector e(278,273,-800);
Vector center(278,273,-700);
Vector up(0,1,0);
float fov = 39.31;
float df = 0.035;





// Valores de la esfera
Vector position(370,120,370);
float radius = 120;

Camara camera(e, center, up, fov, df);
Esfera sphere(position, radius);
Vector dir;
for(int i=0; i<=nx;i++){
		for(int j=0;j<=ny;j++){
			dir = camera.direccionRayo(i,j,nx,ny);
			Rayo ray(e,dir);
			sphere.interseccion(ray,radius);
		}
	}













	/*
	Camara camera(e, center, up, fov, df);
	Vector dir;
	for(int i=0; i<=nx;i++){
		for(int j=0;j<=ny;j++){
			dir = camera.direccionRayo(i,j,nx,ny);
			dir.show();
		}
	}
	*/
	return 0;
}