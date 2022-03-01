/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


        function selecionarSaida(){
      var rIndex,saida = document.getElementById("tabelaSaida") 
         for(var i = 0; i < saida.rows.length; i++){

            saida.rows[i].onclick = function(){
            rIndex = this.rowIndex;
            console.log(rIndex)
            document.getElementById("editarcategprt").value = saida.rows[rIndex].cells[3].innerText
            document.getElementById("editarcategClient").value = saida.rows[rIndex].cells[4].innerText
            document.getElementById("editarqtdeVenda").value = saida.rows[rIndex].cells[5].innerText
            document.getElementById("editardataVenda").value = saida.rows[rIndex].cells[6].innerText.replaceAll("/","-").split("-").reverse().join("-")
            document.getElementById("editarvalorVenda").value = saida.rows[rIndex].cells[7].innerText
            document.getElementById("editarcategVend").value = saida.rows[rIndex].cells[8].innerText
            document.getElementById("editarID").value = saida.rows[rIndex].cells[1].innerText
              document.getElementById("codigoExcluir").value = saida.rows[rIndex].cells[1].innerText
        }
    }  
}
     
