create database db_Calmamente;

CREATE TABLE Usuario(   
id INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL,
   senha_hash VARCHAR(255) NOT NULL,
   dt_nascimento DATE,
   telefone VARCHAR(45),
   UNIQUE KEY email_UNIQUE (email) 
   );
CREATE TABLE Historico(   
	id INT PRIMARY KEY AUTO_INCREMENT,
   data_hora_clique DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
   fk_usuario_id INT NOT NULL,
   KEY fk_Historico_Usuario_idx (fk_usuario_id),
   CONSTRAINT fk_Historico_Usuario FOREIGN KEY (fk_usuario_id) REFERENCES Usuario (id) ON DELETE NO ACTION ON UPDATE NO ACTION 
   );
CREATE TABLE FolderComunicacao(   
	id INT PRIMARY KEY AUTO_INCREMENT,
   titulo VARCHAR(255) NOT NULL,
   frase VARCHAR(500) NOT NULL,
   img_url VARCHAR(255) NOT NULL,
   audio_url VARCHAR(255) NOT NULL,
   fk_usuario_id INT NOT NULL,
   KEY fk_FolderComunicacao_Usuario_idx (fk_usuario_id),
   CONSTRAINT fk_FolderComunicacao_Usuario FOREIGN KEY (fk_usuario_id) REFERENCES Usuario (id) ON DELETE NO ACTION ON UPDATE NO ACTION
   ); 
CREATE TABLE FolderSentimento( 
	id INT PRIMARY KEY AUTO_INCREMENT,
	tipo_emocao VARCHAR(45) NOT NULL,
	fk_usuario_id INT NOT NULL,
	UNIQUE KEY tipo_emocao_UNIQUE (tipo_emocao),
	KEY fk_FolderSentimento_Usuario1_idx (fk_usuario_id),
	CONSTRAINT fk_FolderSentimento_Usuario1 FOREIGN KEY (fk_usuario_id) REFERENCES Usuario (id) ON DELETE NO ACTION ON UPDATE NO ACTION 
 );