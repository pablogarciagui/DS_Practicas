from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from carreraCarretera import CarreraCarretera
from BicicletaCarretera import BicicletaCarretera

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def crearCarrera(bicicletas):
        return CarreraCarretera(bicicletas, porcent_retirada=0)

    def crearBicicleta(id):
        return BicicletaCarretera(id)