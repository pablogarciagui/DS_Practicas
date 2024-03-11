from Bicicleta import Bicicleta
from copy import deepcopy

class BicicletaMontana(Bicicleta):
    
    def clone(self):
        return deepcopy(self)