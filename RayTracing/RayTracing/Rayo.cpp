#include "Rayo.h"


Rayo::Rayo()
{
}

Rayo::Rayo(Vector posicion, Vector direccion)
{
	this->posicion = posicion;
	this->direccion = direccion;
}


Rayo::~Rayo()
{
}

void Rayo::show(){
	cout << "Posicion: ";
	this->posicion.show();
	cout << "Direccion: ";
	this->direccion.show();
}