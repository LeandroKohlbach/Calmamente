package modelos;

public class FolderComunicacao {
	private int id;
    private String titulo;
    private String frase;
    private String imgUrl;
    private String audioUrl;
    private int fkUsuarioId;
	public FolderComunicacao(int id, String titulo, String frase, String imgUrl, String audioUrl, int fkUsuarioId) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.frase = frase;
		this.imgUrl = imgUrl;
		this.audioUrl = audioUrl;
		this.fkUsuarioId = fkUsuarioId;
	}
    
	public FolderComunicacao() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getFrase() {
		return frase;
	}

	public void setFrase(String frase) {
		this.frase = frase;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getAudioUrl() {
		return audioUrl;
	}

	public void setAudioUrl(String audioUrl) {
		this.audioUrl = audioUrl;
	}

	public int getFkUsuarioId() {
		return fkUsuarioId;
	}

	public void setFkUsuarioId(int fkUsuarioId) {
		this.fkUsuarioId = fkUsuarioId;
	}
	
}
