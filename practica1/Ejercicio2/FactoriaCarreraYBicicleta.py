from abc import ABC, abstractmethod

class FactoriaCarreraYBicicleta(ABC):
    @abstractmethod
    def crearCarrera():
        pass
    
    @abstractmethod
    def crearBicicleta():
        pass