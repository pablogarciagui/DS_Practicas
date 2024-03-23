
from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from FactoriaCarretera import FactoriaCarretera
from FactoriaMontana import FactoriaMontana
import time

if __name__ == "__main__":
    usuario = input("Bicicletas: ")
    num_bicicletas = int(usuario)

    factoriaCarretera = FactoriaCarretera
    factoriaMontana = FactoriaMontana

    auxBCarretera = []
    auxBMontana = []

    for i in range(num_bicicletas):
        auxBCarretera.append(factoriaCarretera.crearBicicleta(i))
        auxBMontana.append(factoriaMontana.crearBicicleta(i+num_bicicletas))

    carreraCarretera = factoriaCarretera.crearCarrera(auxBCarretera)
    carreraMontana = factoriaMontana.crearCarrera(auxBMontana)

    carreraCarretera.addNumBicicletas(auxBCarretera)
    carreraMontana.addNumBicicletas(auxBMontana)

    carreraCarretera.comenzarCarrera()
    carreraMontana.comenzarCarrera()

    carreraCarretera.retirarBicicletasPorcentaje(70)
    carreraMontana.retirarBicicletasPorcentaje(70)

    carreraCarretera.acabarCarrera()
    carreraMontana.acabarCarrera()
