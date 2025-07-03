package modelos;

import java.time.LocalDateTime;

public class Historico {
	 private int id;
	 private String nomeSentimento;
	 private LocalDateTime dataHoraClique;
	 private int fkUsuarioId;
	 
	 
	 public Historico() {
	    }


	public Historico(LocalDateTime dataHoraClique, String nomeSentimento, int fkUsuarioId) {
		this.nomeSentimento = nomeSentimento;
		this.fkUsuarioId = fkUsuarioId;
		this.dataHoraClique = dataHoraClique;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNomeSentimento() {
		return nomeSentimento;
	}


	public void setNomeSentimento(String nomeSentimento) {
		this.nomeSentimento = nomeSentimento;
	}


	public LocalDateTime getDataHoraClique() {
		return dataHoraClique;
	}


	public void setDataHoraClique(LocalDateTime dataHoraClique) {
		this.dataHoraClique = dataHoraClique;
	}


	public int getFkUsuarioId() {
		return fkUsuarioId;
	}


	public void setFkUsuarioId(int fkUsuarioId) {
		this.fkUsuarioId = fkUsuarioId;
	}
	 
	 
}

