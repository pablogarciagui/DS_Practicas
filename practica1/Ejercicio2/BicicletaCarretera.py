from Bicicleta import Bicicleta
from copy import deepcopy

class BicicletaCarretera(Bicicleta):
    
    def clone(self):
        return deepcopy(self)
