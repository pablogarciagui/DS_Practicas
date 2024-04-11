from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from carreraMontana import CarreraMontana
from BicicletaMontana import BicicletaMontana

class FactoriaMontana(FactoriaCarreraYBicicleta):
    def crearCarrera(bicicletas):
        return CarreraMontana(bicicletas, porcent_retirada=0)

    def crearBicicleta(id):
        return BicicletaMontana(id)