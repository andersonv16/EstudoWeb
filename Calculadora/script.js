function calcular (tipo, valor){
if (tipo === 'acao'){
    if(valor === 'c'){
        document.getElementById("visor").value   = ''
    }
    if(valor === '+' || valor === '-' || valor === '*' || valor === '/' || valor === '.'){
        document.getElementById('visor').value += valor
        }
        if(valor === '=') {
        var valor_campo = eval(document.getElementById('visor').value)
        document.getElementById('visor').value = valor_campo
        }

}else if (tipo === 'valor') {
    document.getElementById("visor").value += valor
}
}

function tecla(event){
  if (event.keyCode == 48 || event.keyCode == 96){
    document.getElementById("visor").value += '0'
  }
  else if (event.keyCode == 49 || event.keyCode == 97){
    document.getElementById("visor").value += '1'
  }

  else if (event.keyCode == 50 || event.keyCode == 98){
    document.getElementById("visor").value += '2'
  }
  else if (event.keyCode == 51 || event.keyCode == 99){
    document.getElementById("visor").value += '3'
  }
  else if (event.keyCode == 52 || event.keyCode == 100){
    document.getElementById("visor").value += '4'
  }
  else if (event.keyCode == 53 || event.keyCode == 101){
    document.getElementById("visor").value += '5'
  }
  else if (event.keyCode == 54 || event.keyCode == 102){
    document.getElementById("visor").value += '6'
  }
  else if (event.keyCode == 55 || event.keyCode == 102){
    document.getElementById("visor").value += '7'
  }
  else if (event.keyCode == 56 || event.keyCode == 103){
    document.getElementById("visor").value += '8'
  }
  else if (event.keyCode == 57 || event.keyCode == 104){
    document.getElementById("visor").value += '9'
  }
  else if (event.keyCode == 8 || event.keyCode == 46){
    document.getElementById("visor").value   = ''
  }
  else if (event.keyCode == 107 || event.keyCode == 187){
    document.getElementById("visor").value   += '+'
  }
  else if (event.keyCode == 109 || event.keyCode == 189){
    document.getElementById("visor").value   +='-'
  }
  else if (event.keyCode == 106 || event.keyCode == 56){
    document.getElementById("visor").value   += '*'
  }
  else if (event.keyCode == 111 || event.keyCode == 193){
    document.getElementById("visor").value   += '/'
  }
  else if (event.keyCode == 190 || event.keyCode == 188 || event.keyCode == 110){
    document.getElementById("visor").value   += '.'
  }
  else if (event.keyCode == 187 || event.keyCode == 13){
    var valor_campo = eval(document.getElementById('visor').value)
        document.getElementById('visor').value = valor_campo
  }
  
  }