var main1 = echarts.init(document.getElementById('main'));
//获取所有课程的名称
var course_list = [];
var course_student_list = []
//获取各科选课人数
$.ajax({
    url:"http://127.0.0.1:5000/manage/user/stu_bar_data",//返回示例[["高数",100],["英语"],200]
    type:"GET",
    data:{},
    success:function (data) {
        if(data.success){
             $.each(data.data,function (index,item) {
                    course_list.push(item[0]) //将课程名称放入该列表
                    course_student_list.push(item[1]) //将其对应人数放入列表
             })
            var option = {
    title: {
        text: '各科被选人数'
    },
    tooltip: {},
    legend: {
        data:['人数']
    },
    xAxis: {
        data: course_list,
        axisLabel: {
                    interval: 0,
                    rotate: -20, // 20度角倾斜显示(***这里是关键)

    },},
    yAxis: {},
    series: [{
        name: '人数',
        type: 'bar',
        data: course_student_list,
        axisTick: {
            inside: true
        },
    }]
};
// 使用刚指定的配置项和数据显示图表。
main1.setOption(option);
        }else{
            layui.layer.msg("获取数据失败")
        }
    }
})
// 指定图表的配置项和数据

