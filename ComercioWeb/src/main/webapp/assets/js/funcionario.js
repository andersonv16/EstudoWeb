/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


        function selecionarFuncionario(){
      var rIndex,funcionario = document.getElementById("tabelaFuncionario") 
         for(var i = 0; i < funcionario.rows.length; i++){
      
        
            funcionario.rows[i].onclick = function(){
            rIndex = this.rowIndex;
            console.log(rIndex)
            document.getElementById("nomeeditar").value = funcionario.rows[rIndex].cells[1].innerText
            document.getElementById("nasceditar").value = funcionario.rows[rIndex].cells[2].innerText
            document.getElementById("editarRG").value = funcionario.rows[rIndex].cells[3].innerText
            document.getElementById("editarCPF").value = funcionario.rows[rIndex].cells[4].innerText
            document.getElementById("cargoeditar").value = funcionario.rows[rIndex].cells[5].innerText
            document.getElementById("enderecoeditar").value = funcionario.rows[rIndex].cells[6].innerText
            document.getElementById("editarEstado").value = funcionario.rows[rIndex].cells[7].innerText
            document.getElementById("cepeditar").value = funcionario.rows[rIndex].cells[8].innerText
            document.getElementById("codigoExcluir").value = funcionario.rows[rIndex].cells[4].innerText
        }
    }  
}

