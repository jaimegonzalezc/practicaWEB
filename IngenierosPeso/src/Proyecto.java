
public class Proyecto {
	private int idProyecto;
	private String fechaIni;
	private String fechaFin;
	private String descripcion;

	

	public Proyecto(int idProyecto, String fechaIni, String fechaFin, String descripcion) {
		super();
		this.idProyecto = idProyecto;
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
		this.descripcion = descripcion;
	}

	public int getIdProyecto() {
		return idProyecto;
	}

	public void setIdProyecto(int idProyecto) {
		this.idProyecto = idProyecto;
	}

	public String getFechaIni() {
		return fechaIni;
	}

	public void setFechaIni(String fechaIni) {
		this.fechaIni = fechaIni;
	}

	public String getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
