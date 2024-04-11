from abc import ABC, abstractmethod
class Carrera(ABC):
    __DURACION = 60
    bicicletas = []

    def __init__(self, num_bicicletas, porcent_retirada):
        self.num_bicicletas = num_bicicletas
        self.porcent_retirada = porcent_retirada

    def comenzarCarrera(self):
        print("Comienza la carrera.\n")

    def acabarCarrera(self):
        print("Acaba la carrera.\n")

    def retirarBicicleta(self):
        if(len(self.bicicletas) > 0):
            self.bicicletas = self.bicicletas[:-1] # Quita la última bicicleta si hay bicicletas

    def retirarBicicletasPorcentaje(self, porcent_retirada):
        bicis_retirar = len(self.bicicletas)*(float)(porcent_retirada/100)

        for bicicleta in range(int(bicis_retirar)):
            self.retirarBicicleta()

    def retirarBicicletasTodas(self):
        self.bicicletas = []

    def anadirBicicleta(self, Bicicleta):
        self.bicicletas.append(Bicicleta)

    def addNumBicicletas(self, bicis): # Para este el nombre lo veo un poco raro
        for bicicleta in bicis:
            self.bicicletas.append(bicicleta)
