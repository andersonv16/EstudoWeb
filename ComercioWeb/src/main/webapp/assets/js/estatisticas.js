/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    
    
   var retornoMap = lista.map((valores) => {

    return valores;
})
    
   var retornoDatas = datas.map((valores) => {

    return valores;
})
       var retornoEstoque = listaEstoque.map((valores) => {

    return valores;
})
    
   var retornoQuantidade = quantidades.map((valores) => {

    return valores;
})
    
   var retornoSaida = listaSaida.map((valores) => {

    return valores;
})
    
   var retornoDataSaida = dataSaida.map((valores) => {

    return valores;
})

var valorTotal = retornoMap.reduce((prev, curr) => prev + curr, 0).toLocaleString('pt-br',{style: 'currency', currency: 'BRL'});
var valorTotalSaida = retornoSaida.reduce((prev, curr) => prev + curr, 0).toLocaleString('pt-br',{style: 'currency', currency: 'BRL'});
var valorEstoque = retornoQuantidade.reduce((prev, curr) => prev + curr, 0)

var graficoEntrada = {
  chart: {
    id: 'chart',
    group: 'sparklines',
    type: 'area',
    height: 300,
  
  },
  stroke: {
    curve: 'straight'
  },
  fill: {
    opacity: 1,
  },
  series: [{
    name: 'Compras',
    data: retornoMap
  }],
    xaxis: {
    
    categories: retornoDatas
  },
  colors: ['#9c161c'],
  title: {
    text: valorTotal ,
    offsetX: 30,
    style: {
      fontSize: '24px',
       color:  '#e81a1a',
      cssClass: 'tituloSaida'
     
    }
  },
  subtitle: {
    text: 'Compras',
    offsetX: 150,
    style: {
      fontSize: '18px',
      cssClass: 'apexcharts-yaxis-title'
    }
  }
}
var graficoSaida = {
  chart: {
    id: 'chartSaida',
    type: 'area',
    height: 300,
  
  },
  stroke: {
    curve: 'straight'
  },
  fill: {
    opacity: 1,
  },
  series: [{
    name: 'Vendas',
    data: retornoSaida
  }],
    xaxis: {
    
    categories: retornoDataSaida
  },
  colors: ['#189c16'],
  title: {
    text: valorTotalSaida ,
    offsetX: 30,
    style: {
      fontSize: '24px',
      color: '#1ae81d',
      cssClass: 'apexcharts-yaxis-title'
    }
  },
  subtitle: {
    text: 'Vendas',
    offsetX: 150,
    style: {
      fontSize: '18px',
      cssClass: 'apexcharts-yaxis-title'
    }
  }
}

var graficoCompara = {
      series: [{
          name: 'Vendas',
          type: 'column',
           data: retornoSaida,
          color: '#1ae81d',
        
        },  {
            
          name: 'Compras',
          type: 'column',
            data: retornoMap,
          color: '#9c161c'
        }],
          chart: {
          height: 350,
          type: 'line',
        },
    
        title: {
          text: 'Comparativo de Entradas e Saídas',
           fontSize: '24px',
           offsetX: 170
        },
        dataLabels: {
          enabled: true,
          enabledOnSeries:[0] [1]
        },
      
        yaxis: [{
          title: {
            text: 'Compras',
          },
        
        }, {
          opposite: true,
          title: {
            text: 'Vendas'
          }
        }]
        };
    
     var graficoEstoque = {
          series: retornoQuantidade,
          chart: {
          height: 350,
          type: 'donut',
           dropShadow: {
            enabled: true,
            color: '#111',
            top: -1,
            left: 3,
            blur: 3,
            opacity: 0.2
          }
        },
                title: {
          text: 'Posição do estoque',
           fontSize: '24px',
           offsetX: 230
              },
        plotOptions: {
          pie: {
            donut: {
              labels: {
                show: true,
                total: {
                  showAlways: true,
                  show: true
                }
          
              },
        responsive: [{
          breakpoint: 480,
          options: {
            chart: {
              width: 200
            },
            legend: {
              position: 'bottom'
            }
          }
        }],
              total: {
                show: true,
                label: 'Total',
                formatter: function (w) {
                  // By default this function returns the average of all series. The below is just an example to show the use of custom formatter function
                  return valorEstoque
                }
              }
            }
          }
        },
        labels: retornoEstoque,
        };
        
new ApexCharts(document.querySelector("#chart"), graficoEntrada).render();
new ApexCharts(document.querySelector("#chartSaida"), graficoSaida).render();
new ApexCharts(document.querySelector("#chartCompara"), graficoCompara).render();
new ApexCharts(document.querySelector("#chartEstoque"), graficoEstoque).render();