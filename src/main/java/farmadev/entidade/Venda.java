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
public class Venda {
     private int id;
    private String usuario;
    private String cpf;    
    private Double total;
    private String data;
    private Double desconto;    
    
    public Venda( String usuario, String cpf, double total, String data, double desconto) {
      
        this.usuario = usuario;
        this.cpf = cpf;
        this.total = total;
        this.data = data;
        this.desconto = desconto;
    }

    public Venda(int id , String usuario, String cpf, double total,  String data, double desconto ) {
  
    this.id=id;
    this.usuario=usuario;
    this.cpf=cpf;
    this.total=total;
    this.data=data;
    this.desconto=desconto;
    
    }

    public double getDesconto() {
        return desconto;
    }

    public void setDesconto(double desconto) {
        this.desconto = desconto;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String nome) {
        this.usuario = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
    
}


