public class CalcularVelocidad implements Filtro{
    private double incrementoVelocidad;
    private int MAX_REVOLUCIONES = 5000;

    CalcularVelocidad(){
        this.incrementoVelocidad = 0;
    }

    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        switch (estadomotor) {
            case APAGADO:
                incrementoVelocidad = 0;
                break;
            
            case ENCENDIDO:
                incrementoVelocidad = 0;
                break;
        
            case ACELERANDO:
                incrementoVelocidad = 100;
                break;

            case FRENANDO:
                incrementoVelocidad = -100;
                break;

            default:
                break;
        }

        if((revoluciones + incrementoVelocidad) <= MAX_REVOLUCIONES)
            revoluciones += incrementoVelocidad;

        return revoluciones;
    }
}