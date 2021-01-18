package clases;


public class Proyecto {
	private int idProyecto;
	private String titulo;
	private String descripcion;
	private String fechaIni;
	private String fechaFin;
	

	

	public Proyecto(int idProyecto, String titulo, String fechaIni, String fechaFin, String descripcion) {
		super();
		this.idProyecto = idProyecto;
		this.titulo = titulo;
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
		this.descripcion = descripcion;
	}
	public Proyecto(String titulo, String fechaIni, String fechaFin, String descripcion) {
		super();
		this.titulo = titulo;
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
		this.descripcion = descripcion;
	}

	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
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
