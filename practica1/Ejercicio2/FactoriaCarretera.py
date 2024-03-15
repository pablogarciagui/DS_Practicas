from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from carreraCarretera import CarreraCarretera
from BicicletaCarretera import BicicletaCarretera

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def crearCarrera(self, bicicletas):
        return CarreraCarretera(bicicletas)

    def crearBicicleta(self, id):
        return BicicletaCarretera(id)