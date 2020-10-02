/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farmadev.entidade;

/**
 *
 * @author diego
 */
public class ItensVenda {
     
    private int itensVendaID;
    private int produtoID;
    private String nome;
    private int quantidade;
    private double valorUnitario;
    private double total;
        private String dataVenda;
         private String imagem;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public ItensVenda(int produtoID, String nome, int quantidade, double valorUnitario, double total, String dataVenda, String Imagem) {
        this.produtoID = produtoID;
        this.nome = nome;
        this.quantidade = quantidade;
        this.valorUnitario = valorUnitario;
        this.total = total;
        this.dataVenda = dataVenda;
        this.imagem = Imagem;
    }
    
    
    
    public ItensVenda(int itensVendaID, int produtoID, String nome, int quantidade, double valorUnitario, double total, String dataVenda,String Imagem) {
        this.itensVendaID = itensVendaID;
        this.produtoID = produtoID;
        this.nome = nome;
        this.quantidade = quantidade;
        this.valorUnitario = valorUnitario;
        this.total = total;
        this.dataVenda = dataVenda;
         this.imagem = Imagem;
    }

    public int getItensVendaID() {
        return itensVendaID;
    }

    public void setItensVendaID(int itensVendaID) {
        this.itensVendaID = itensVendaID;
    }

    public int getProdutoID() {
        return produtoID;
    }

    public void setProdutoID(int produtoID) {
        this.produtoID = produtoID;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(double valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(String dataVenda) {
        this.dataVenda = dataVenda;
    }
    
    
    
    
}

