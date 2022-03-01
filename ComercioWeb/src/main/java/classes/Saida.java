package classes;

public class Saida {
    
   int id;
   int quantidade;
   String cod_produto;
   String cliente;
   String data;
   Double valor;
   String vendedor;	
   String nome;

    public Saida() {
    }

    public Saida(int id, int quantidade, String cod_produto, String cliente, 
            String data, Double valor, String vendedor, String nome) {
        this.id = id;
        this.quantidade = quantidade;
        this.cod_produto = cod_produto;
        this.cliente = cliente;
        this.data = data;
        this.valor = valor;
        this.vendedor = vendedor;
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getCod_produto() {
        return cod_produto;
    }

    public void setCod_produto(String cod_produto) {
        this.cod_produto = cod_produto;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getVendedor() {
        return vendedor;
    }

    public void setVendedor(String vendedor) {
        this.vendedor = vendedor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
   
   
}
