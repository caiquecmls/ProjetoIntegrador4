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
public class Imagem {
    
    private int id1;
    private int id2;
    private int id3;

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }
    private String imagem1;
    private String imagem2;
    private String imagem3;
    
       public int getId2() {
        return id2;
    }

    public void setId2(int id2) {
        this.id2 = id2;
    }
       public int getId3() {
        return id3;
    }

    public void setId3(int id3) {
        this.id1 = id3;
    }

    public Imagem(String imagem1, String imagem2, String imagem3) {
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
    }

    public Imagem(int id1, String imagem1,int id2, String imagem2,int id3 , String imagem3) {
        this.id1 = id1;
        this.id2 = id2;
        this.id3 = id3;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
    }
    
     public Imagem(int id1, String imagem1){
         this.id1=id1;
      this.imagem1 = imagem1;
     }
    
    public Imagem(String imagem1){
        this.imagem1 = imagem1;
    }
 
    public String getImagem1() {
        return imagem1;
    }

    public void setImagem1(String imagem1) {
        this.imagem1 = imagem1;
    }

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public String getImagem3() {
        return imagem3;
    }

    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }
    //blz
}
    
