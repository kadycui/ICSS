/**
 * @description ����id�Ż�ȡʵ�����
 * @param url ��ȡ����Ľӿڵ�ַ
 * @param id
 */
function getEntityById(id,url) {
    var obj =null;
    $.ajax({
        url:url,
        type:"POST",
        data:{id:id},
        success:function (data) {
            if(data.success){
                obj = data.data
            }
            layer.msg("��ȡ��Ϣʧ��")
        }
    })
    if(obj != null){
        return obj
    }
}

/**
 * @description ͨ��numbe��ȡ������Щ���࣬����ǰ�淽�����˺ö࣬���øģ���϶ȹ��ߵ������
 * @param number ѧ�Ż��߹���
 * @param url ��ȡ����ĵ�ַ�ӿ�
 * @return
 */
function getEntityByNumber(number,url) {
    var obj =null;
    $.ajax({
        url:url,
        type:"POST",
        data:{number:number },
        success:function (data) {
            if(data.success){
                obj = data.data
            }
            layer.msg("��ȡ��Ϣʧ��")
        }
    });
    if(obj != null){
        return obj
    }
}
//ѧ��
if(window.sessionStorage.getItem("student") != null){
    var student = window.sessionStorage.getItem("student")
}
//��ʦ
if(window.sessionStorage.getItem("teacher") != null){
    var teacher = window.sessionStorage.getItem("teacher")
}
//����Ա
if(window.sessionStorage.getItem("admin") != null){
    var admin = window.sessionStorage.getItem("admin")
}

/**
 * @description �÷�����Ҫ����ѧ��ѡ��
 * @param number ѧ��ѧ��
 * @param course_number �γ̱��
 * @param tea �γ̱��
 */
function selectCourse(number,course_number,tea) {
    $.ajax({
        url:"http://127.0.0.1:5000/student/performance_student",
        type:"POST",
        data:{
            student_number:number,
            course_number:course_number,
            teacher:tea,
            flag:1
        },
        success:function (data) {
            if(data.success){
                layer.msg("ѡȡ�ɹ�")
            }
        }
    })
}

/**
 * @description ͨ��teacher_id����ȡ��ʦ�����ύ�Ŀα�
 * @param teacher_id
 * @return ���ؽ�ʦ���˿α�list
 */
function getCourseListByTeacher_id(teacher_number) {
    var course_list = null;
    $.ajax({
        url:"http://127.0.0.1:5000/course_teacher",
        type:"POST",
        data:{
            teacher_number: teacher_number
        },
        success:function (data) {
            if(data.success){
              course_list = data.data
            }
        }
    })
    if(course_list!=null){
        return course_list
    }
}