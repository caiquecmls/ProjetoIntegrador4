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
    
    private String nome;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    private String descricao;
    private int quantidade;
    private double valor;
    private String categoria;
    private int id;
     private String desconto;
      private String promocao;
      private String imagem;

    public String getDesconto() {
        return desconto;
    }

    public void setDesconto(String desconto) {
        this.desconto = desconto;
    }

    public String getPromocao() {
        return promocao;
    }

    public void setPromocao(String promocao) {
        this.promocao = promocao;
    }
    

    private boolean status;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Produto(String nome , String descricao, int quantidade, double valor, String categoria,String desconto, String promocao) {
        
        this.nome=nome;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
        this.categoria = categoria;
        this.desconto=desconto;
        this.promocao=promocao;
    }
    public Produto(int id ,String nome,  String descricao, int quantidade, double valor, String categoria, String imagem) {
        
        this.id=id;
        this.nome=nome;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
        this.categoria = categoria;
        this.imagem=imagem;
    }
        public Produto(int id ,String nome, String descricao, int quantidade, double valor, String categoria,String desconto, String promocao, String imagem) {
        
        this.id=id;
        this.nome=nome;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
        this.categoria = categoria;
        this.desconto=desconto;
        this.promocao=promocao;
    this.imagem=imagem;
    }
        
                public Produto(int id ,String nome, String descricao, int quantidade, double valor, String categoria,String desconto, String promocao) {
        
        this.id=id;
        this.nome=nome;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
        this.categoria = categoria;
        this.desconto=desconto;
        this.promocao=promocao;
  
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
