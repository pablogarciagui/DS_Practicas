from abc import ABC, abstractmethod

class Bicicleta(ABC):
    idBicicleta = none

    def __init__(self, id):
        self.idBicicleta = id

    @abstractmethod
    def clone(self):
        pass

    def correr(self):
        print("Bicicleta " + self.idBicicleta + " corriendo")
        
    def anuncioRetirada(self):
        print("Bicicleta " + self.idBicicleta + " se retira.")

