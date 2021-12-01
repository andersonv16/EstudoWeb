package classes;
public class Entrada {
    int id;
    String cod_produto, nome_produto;
    int quantidade;
    double valor;
    String data;

    public Entrada() {
    }

    public Entrada(int id, String cod_produto, String nome_produto, int quantidade, double valor, String data) {
        this.id = id;
        this.cod_produto = cod_produto;
        this.nome_produto = nome_produto;
        this.quantidade = quantidade;
        this.valor = valor;
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCod_produto() {
        return cod_produto;
    }

    public void setCod_produto(String cod_produto) {
        this.cod_produto = cod_produto;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
    
    
       
}
