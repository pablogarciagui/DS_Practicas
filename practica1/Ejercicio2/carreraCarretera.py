from Carrera import Carrera
from copy import deepcopy

class CarreraCarretera(Carrera):
    __PORCENT_RETIRADA = 0.2

    def clone(self):
        return deepcopy(self)