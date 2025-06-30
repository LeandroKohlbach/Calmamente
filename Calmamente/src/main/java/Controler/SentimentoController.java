package Controler;

import Dao.DaoSentimentos; 
import modelos.FolderSentimento; 

public class SentimentoController {
		public SentimentoController(){
			
		}
		public void salvar(FolderSentimento sentimentos) {
			DaoSentimentos.insert(sentimentos); // Esta linha chama diretamente o insert do DaoSentimentos
		}
}