
from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from FactoriaCarretera import FactoriaCarretera
from FactoriaMontana import FactoriaMontana
import time
import threading

if __name__ == "__main__":
    num_bicicletas = usuario

    factoriaCarretera = FactoriaCarretera()
    factoriaMontana = FactoriaMontana()

    auxBCarretera = []
    auxBMontana = []

    for i in range(num_bicicletas):
        auxBCarretera.append(factoriaCarretera.crearBicicleta(i))
        auxBMontana.append(factoriaMontana.crearBicicleta(i+num_bicicletas))

    carreraCarretera = factoriaCarretera.crearCarrera()
    carreraMontana = factoriaMontana.crearCarrera()

    carreraCarretera.addNumBicicletas(auxBCarretera)
    carreraMontana.addNumBicicletas(auxBMontana)

    h1 = threading.Thread(target=carreraCarretera)
    h2 = threading.Thread(target=carreraMontana)

    h1.start()
    h2.start()

