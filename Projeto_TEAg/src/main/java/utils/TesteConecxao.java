package utils;

import java.sql.Connection;

public class TesteConecxao {

	public static void main(String[] args) {
		 try {
			 Connection con = ConexaoDB.getConexao();
	            if (con != null) {
	                System.out.println("Conexão realizada com sucesso!");
	                con.close();
	            } else {
	                System.out.println("Conexão falhou.");
	            }
	        } catch (Exception e) {
	            System.out.println("Erro ao conectar: " + e.getMessage());
	            e.printStackTrace();
	        }
	    }
	}


