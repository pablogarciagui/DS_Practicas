class Carrera:
    __DURACION = 60
    bicicletas = []

    def __init__(self, num_bicicletas, porcent_retirada):
        self.num_bicicletas = num_bicicletas
        self.porcent_retirada = porcent_retirada

    def comenzarCarrera():
        print("Comienza la carrera.\n")

    def acabarCarrera():
        print("Acaba la carrera.\n")

    def retirarBicicleta():
        if(len(Carrera.bicicletas) > 0):
            Carrera.bicicletas = Carrera.bicicletas[:-1] # Quita la última bicicleta si hay bicicletas

    def retirarBicicletasPorcentaje(porcent_retirada):
        bicis_retirar = len(Carrera.bicicletas)*(float)(porcent_retirada/100)

        for bicicleta in range(bicis_retirar):
            Carrera.retirarBicicleta()

    def retirarBicicletasTodas():
        Carrera.bicicletas = []

    def anadirBicicleta(Bicicleta):
        Carrera.bicicletas.append(Bicicleta)

    def addNumBicicletas(bicis): # Para este el nombre lo veo un poco raro
        for bicicleta in bicis:
            Carrera.bicicletas.append(bicis[bicicleta])