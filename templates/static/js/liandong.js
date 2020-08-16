$("#pro").empty()
$.each(place,function (index,item) {
    $("#pro").append("<option value='"+item.name+"'>"+item.name+"</option>")

})

//根据省份查找对应的地址信息
function findPro(pro,p){
    var province
    $.each(p,function (index,item) {
        if(item.name == pro){
            province = item
        }
    })
    return province
}

//遍历选中的省份对应的所有市
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