/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


        function selecionarCliente(){
      var rIndex,cliente = document.getElementById("tabelaCliente") 
         for(var i = 0; i < cliente.rows.length; i++){
      
        
            cliente.rows[i].onclick = function(){
            rIndex = this.rowIndex;
            console.log(rIndex)
            document.getElementById("EditClienteNome").value = cliente.rows[rIndex].cells[1].innerText
            document.getElementById("EditClienteNascimento").value = cliente.rows[rIndex].cells[2].innerText
            document.getElementById("EditClienterg").value = cliente.rows[rIndex].cells[3].innerText
            document.getElementById("EditClientecpf").value = cliente.rows[rIndex].cells[4].innerText
            document.getElementById("EditClienterua").value = cliente.rows[rIndex].cells[5].innerText
            document.getElementById("EditClienteestado").value = cliente.rows[rIndex].cells[6].innerText
            document.getElementById("EditClientecep").value = cliente.rows[rIndex].cells[7].innerText
            document.getElementById("excluirCliente").value = cliente.rows[rIndex].cells[4].innerText
        }
    }  
}
 