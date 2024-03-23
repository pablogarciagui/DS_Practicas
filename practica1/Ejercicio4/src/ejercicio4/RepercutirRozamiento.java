public class RepercutirRozamiento implements Filtro{
    private int ROZAMIENTO;

    RepercutirRozamiento(){
        this.ROZAMIENTO = 30;
    }

    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        return revoluciones - ROZAMIENTO;
    }
}
