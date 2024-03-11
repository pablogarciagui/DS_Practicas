from Carrera import Carrera
from copy import deepcopy

class CarreraMontana(Carrera):
    __PORCENT_RETIRADA = 0.1

    def clone(self):
        return deepcopy(self)