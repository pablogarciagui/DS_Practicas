from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from carreraMontana import CarreraMontana
from BicicletaMontana import BicicletaMontana

class FactoriaMontana(FactoriaCarreraYBicicleta):
    def crearCarrera(self, bicicletas):
        return CarreraMontana(bicicletas)

    def crearBicicleta(self, id):
        return BicicletaMontana(id)