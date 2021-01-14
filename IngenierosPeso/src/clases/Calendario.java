package clases;

public class Calendario {
	private String fechaIni;
	private String fechaFin;
	private String descripcion;
	private String estado;
	private String dniEmp;
	private String dniRh;

	public Calendario(String fechaIni, String fechaFin, String descripcion, String estado, String dniEmp,
			String dniRh) {
		super();
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
		this.descripcion = descripcion;
		this.estado = estado;
		this.dniEmp = dniEmp;
		this.dniRh = dniRh;
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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getDniEmp() {
		return dniEmp;
	}

	public void setDniEmp(String dniEmp) {
		this.dniEmp = dniEmp;
	}

	public String getDniRh() {
		return dniRh;
	}

	public void setDniRh(String dniRh) {
		this.dniRh = dniRh;
	}

}
