/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.entidade;

/**
 *
 * @author Renato
 */
public class Perguntas {
    
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private String pergunta;
    private String resposta;

    

    public Perguntas(String pergunta, String resposta) {
        this.pergunta = pergunta;
        this.resposta = resposta;
    }
    
        public Perguntas(int id , String pergunta, String resposta) {
            this.id = id;
        this.pergunta = pergunta;
        this.resposta = resposta;
    }
    

    public String getPergunta() {
        return pergunta;
    }


    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    
    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta1) {
        this.resposta = resposta1;
    }
    
}
