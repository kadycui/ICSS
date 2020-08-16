$("#pro").empty()
$.each(place,function (index,item) {
    $("#pro").append("<option value='"+item.name+"'>"+item.name+"</option>")

})

//����ʡ�ݲ��Ҷ�Ӧ�ĵ�ַ��Ϣ
function findPro(pro,p){
    var province
    $.each(p,function (index,item) {
        if(item.name == pro){
            province = item
        }
    })
    return province
}

//����ѡ�е�ʡ�ݶ�Ӧ��������
function getCity(){
    var pro = $("#pro").val()
    pro = findPro(pro,place)
    $("#cit").empty()
    $.each(pro.city,function (index,item) {
        $("#cit").append("<option value='"+item.name+"'>"+item.name+"</option>")
    })
    layui.form.render('select')
}

function getCount(){
    var cit = $("#cit").val()
    var pro = $("#pro").val()
    pro = findPro(pro,place)
    cit = findCit(cit,pro)
    layui.form.render('select')
}