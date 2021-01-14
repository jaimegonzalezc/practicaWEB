package clases;
public class Empresa {
    private String CIF;
    private String nombre;
    private String direccion;
    private int CP;
    private String ciudad;
    private String provincia;
    private int numero;

    public Empresa(String CIF, String nombre, String direccion, int CP, String ciudad, String provincia, int numero) {
        this.CIF = CIF;
        this.nombre = nombre; 
        this.direccion = direccion;
        this.CP = CP; 
        this.ciudad = ciudad;
        this.provincia = provincia;
        this.numero = numero;
    }

	public String getCIF() {
		return CIF;
	}

	public void setCIF(String cIF) {
		CIF = cIF;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public int getCP() {
		return CP;
	}

	public void setCP(int cP) {
		CP = cP;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

    
}
