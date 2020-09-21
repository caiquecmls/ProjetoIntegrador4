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
public class Produto {
    
    private String descricao;
    private int quantidade;
    private double valor;
    private String categoria;
    private int id;
    private String pergunta;
    private String imagem;
    private boolean status;


    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Produto(String descricao, int quantidade, double valor, String categoria,String pergunta, String imagem) {
        
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
        this.categoria = categoria;
        this.pergunta = pergunta;
        this.imagem = imagem;
    }
    public Produto(int id , String descricao, int quantidade, double valor, String categoria) {
        
        this.id=id;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
        this.categoria = categoria;
    }
        public Produto(int id , String descricao, int quantidade, double valor, String categoria, String pergunta, String imagem) {
        
        this.id=id;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
        this.categoria = categoria;
        this.pergunta=pergunta;
        this.imagem = imagem;
    }
    public Produto() {
    }

     public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }
}
