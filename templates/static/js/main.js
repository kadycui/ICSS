var myChart = echarts.init(document.getElementById('main'));
//获取所有课程的名称
var course_list = [];
var course_student_list = []
//获取各科选课人数
$.ajax({
    url:"http://localhost:5000/manage/admin/获取所有课程的名称",//返回示例[["高数",100],["英语"],200]
    type:"GET",
    data:{},
    success:function (data) {
        if(data.success){
             $.each(data.data,function (index,item) {
                    course_list.append(item[0]) //将课程名称放入该列表
                    course_student_list.append(item[1]) //将其对应人数放入列表
             })
        }else{
            layui.layer.msg("获取数据失败")
        }
    }
})
// 指定图表的配置项和数据
var option = {
    title: {
        text: '各科被选人数'
    },
    tooltip: {},
    legend: {
        data:['人数']
    },
    xAxis: {
        data: course_list
    },
    yAxis: {},
    series: [{
        name: '人数',
        type: 'bar',
        data: course_student_list
    }]
};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);