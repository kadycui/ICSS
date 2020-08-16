var chart2 = echarts.init(document.getElementById('main3'));
    var list_item = [];
$.ajax({
    url:"http://127.0.0.1:5000/manage/user/stu_hobby_data",//返回示例[["高数",100],["英语"],200]
    type:"GET",

    success:function (data) {
        if(data.success) {
            // $.each(data.data, function (index, item) {
            //
            // })
           list_item =[
                {value:data.data[0], name:"JAVA"},
                {value:data.data[1], name:'PYTHON'},
                {value:data.data[2], name:'HADOOP'},
                {value:data.data[3], name:'机器学习'},
                {value:data.data[4], name:'AI'}
                    ]
            var option = {
                title: {
                text: '兴趣爱好'
                     },
                series : [
                {
                    name: '访问来源',
                    type: 'pie',    // 设置图表类型为饼图
                    radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                    data:list_item,
					 itemStyle:{
            normal:{
                  label:{
                    show: true,
                    formatter: '{b} : {c} ({d}%)'
                  },
                  labelLine :{show:true}
                }
            }
                }
            ]
            };
            chart2.setOption(option);

            option.series[0].data = data;//赋值方法2，两种方法等效

        }
    }})
