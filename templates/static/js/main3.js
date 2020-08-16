var main3 = echarts.init(document.getElementById("main3"))
var option = {
    title: {
        text: '系统实时访问人数',//图标标题
        x: 'center'//水平居中
    },
    tooltip: {//提示框信息
        axisPointer: {
            type: 'cross'
        }
    },
    legend: {//图例信息
        data:[ 'A','B','C'],
        top:40//图例位置（可设置top,bottom,left,right）
    },
    grid: {//图的位置
        top: 100,
        bottom: 50
    },
    xAxis: [  //x坐标轴信息
        {
            name : '时间',//坐标单位
            data: [ '9:00', '10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00']//坐标上数值
        },{
            name : '',
            data: []
        }
    ],
    yAxis: [//y坐标轴信息
        {
            name : '访问人数',//坐标单位
            type: 'value',
            min:1000,//坐标起始值
            max:0  //坐标最大值
        }
    ],
    series: [
     {
            name:'系统访问情况',
            type:'line',
            xAxisIndex: 1,
            itemStyle:{
                normal:{ color: "#675bba" }
            },
            lineStyle:{
                normal:{width:1, color: "#675bba"  }
            },
            label: {
                normal: {
                    show: true,
                    position: 'bottom'
                }
            },
            smooth: false,
            data: {'9:00':1000,'12:00':500,"13:00":60}
        }
    ]
};
main3.setOption(option)