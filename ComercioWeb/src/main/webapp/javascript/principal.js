/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Mudarestado(el) {
    var display = document.getElementById(el).style.display;
    if (display == "none")
        document.getElementById(el).style.display = 'block';
    else
        document.getElementById(el).style.display = 'none';
}

function estadoEditar(el) {


    var display = document.getElementById(el).style.display;


    if (display == "none") {
        document.getElementById(el).style.display = 'block';
    } else {
        document.getElementById(el).style.display = 'none';
    }


}

function selecionarTabela() {
    var rIndex, produto = document.getElementById("tabelaProduto")
    for (var i = 0; i < produto.rows.length; i++) {


        produto.rows[i].onclick = function () {
            rIndex = this.rowIndex;
            console.log(rIndex)
            document.getElementById("Editcodigo").value = produto.rows[rIndex].cells[1].innerText
            document.getElementById("editNomeProd").value = produto.rows[rIndex].cells[2].innerText
            document.getElementById("EditTextprod").value = produto.rows[rIndex].cells[3].innerText
            document.getElementById("EditCategprod").value = produto.rows[rIndex].cells[4].innerText
            document.getElementById("EditFornecproduto").value = produto.rows[rIndex].cells[5].innerText
            document.getElementById("EditUnidade").value = produto.rows[rIndex].cells[6].innerText
            document.getElementById("EditValorproduto").value = produto.rows[rIndex].cells[7].innerText
            document.getElementById("codigoExcluir").value = produto.rows[rIndex].cells[1].innerText
        }
    }
}


function confirmar() {
    document.querySelector('#excluirform').addEventListener('submit', function (e) {
        var form = this;

        e.preventDefault();

        Swal.fire({
            title: 'Deseja Excluir?',
            text: "Tem certeza que deseja excluir o item?",
            icon: 'warning',
            showCancelButton: true,
            cancelButtonColor: '#3085d6',
            confirmButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Excluir',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                form.submit()
            } else {
                Swal.fire({icon: 'error', title: 'Cancelado...',
                    text: 'O item não será excluido',
                })
            }
        })
    });
}



            