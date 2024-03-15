package ejercicio3;

public interface ElementoJerarquico {

    public void addEmpleado(Empleado empleado);
    public void addDepartamento(Departamento departamento);
    public void removeEmpleado(String dni);
    public void removeDepartamento(String nombre);
    public String toString();

}
