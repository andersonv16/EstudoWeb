/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


        function selecionarEntrada(){
      var rIndex,entrada = document.getElementById("tabelaEntrada") 
         for(var i = 0; i < entrada.rows.length; i++){

            entrada.rows[i].onclick = function(){
            rIndex = this.rowIndex;
            console.log(rIndex)
            document.getElementById("editcategprt").value = entrada.rows[rIndex].cells[3].innerText
            document.getElementById("editqtdeCompra").value = entrada.rows[rIndex].cells[4].innerText
            document.getElementById("editdataCompra").value = entrada.rows[rIndex].cells[5].innerText.replaceAll("/","-").split("-").reverse().join("-")
            document.getElementById("editarID").value = entrada.rows[rIndex].cells[1].innerText
              document.getElementById("codigoExcluir").value = entrada.rows[rIndex].cells[1].innerText
        }
    }  
}

