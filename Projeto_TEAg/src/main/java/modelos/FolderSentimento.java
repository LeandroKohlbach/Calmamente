package modelos;

public class FolderSentimento {
	 private int id;
	 private String tipoEmocao;
	 private String urlImagemEstrategia;
	 private int fkUsuarioId;
	public FolderSentimento(int id, String tipoEmocao, String urlImagemEstrategia, int fkUsuarioId) {
		super();
		this.id = id;
		this.tipoEmocao = tipoEmocao;
		this.urlImagemEstrategia = urlImagemEstrategia;
		this.fkUsuarioId = fkUsuarioId;
	}
	 
	public FolderSentimento() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipoEmocao() {
		return tipoEmocao;
	}

	public void setTipoEmocao(String tipoEmocao) {
		this.tipoEmocao = tipoEmocao;
	}

	public String getUrlImagemEstrategia() {
		return urlImagemEstrategia;
	}

	public void setUrlImagemEstrategia(String urlImagemEstrategia) {
		this.urlImagemEstrategia = urlImagemEstrategia;
	}

	public int getFkUsuarioId() {
		return fkUsuarioId;
	}

	public void setFkUsuarioId(int fkUsuarioId) {
		this.fkUsuarioId = fkUsuarioId;
	}
	
	
}
