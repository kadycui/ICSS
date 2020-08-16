import json
import os
import random
import sys
from datetime import datetime
from django.db.models import Q
from django.db import connection
from django.db.models import Q
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_exempt

import manage.utils as utils
import manage.utils
from manage.message import Message
from manage.models import TeacherInformation, StudentInformation, Admin, Course, Performance


# def login(request):
#     if request.method == 'GET':
#         return render(request, 'select_class/admin/login.html')
#     elif request.method == 'POST':
#         account = request.POST.get('account')
#         password = request.POST.get('password')
#         print(account, password)
#         admin = None
#         try:
#             admin = Admin.objects.get(account=account, password=password)
#         except Exception as error:
#             print('账号或者密码错误', error)
#
#         if admin is None:
#             return fail('账号或者密码错误')
#         # 登陆成功
#         request.session['admin'] = admin
#         return success('登录成功', data=admin)


def admin_change(request):
    if request.method == 'GET':
        # 查看信息
        return render(request, 'select_class/admin/admin.html')
    elif request.method == 'POST':
        # 表单上传
        # user = request.session['user']
        id = request.POST.get("id", None)
        obj = Admin.objects.get(id="{}".format(id))
        obj.account = '{}'.format(request.POST.get("account", None))  # 账号
        obj.password = '{}'.format(request.POST.get("password", None))  # 密码
        obj.save()
        # user.save()
        # del request.session['user']
        return success("修改成功")

def student_again(request):
    print(56656566)
    # 重新加载数据
    user = None
    number = request.POST.get('number')
    try:
        user = StudentInformation.objects.get(id=number)
    except Exception as error:
        print('账号或者密码错误', error)
    if user is None:
        return fail('账号或者密码错误')
    return success('获取成功', data=user.get_dict())

def teacher_again(request):
    # 重新加载数据
    user = None
    number = request.POST.get('number')
    try:
        user = TeacherInformation.objects.get(id=number)
    except Exception as error:
        print('账号或者密码错误', error)
    if user is None:
        return fail('账号或者密码错误')
    return success('获取成功', data=user.get_dict())


def student_manage(request):
    if request.method == 'GET':
        # 查看信息
        return render(request, 'select_class/admin/design_student.html')
    elif request.method == 'POST':
        # 表单上传
        # user = request.session['user']
        flag = request.POST.get("flag") or 1  # 编辑0   新增1
        # 判断是新增还是编辑
        if int(flag) == 1:
            user_obj = StudentInformation(number=request.POST.get("number", None),
                                          name =request.POST.get("name", None),
                                          password=request.POST.get("password", None)

                                          )
            user_obj.save()  # 对象调动save方法保存到数据库
            return HttpResponse(json.dumps({"data":"添加成功"}))
        else:
            obj = StudentInformation.objects.get(number="{}".format(request.POST.get("number", None)))
            # obj.number = '{}'.format(request.POST.get("number", None))  # 学号
            obj.name = '{}'.format(request.POST.get("name", None))  # 姓名
            obj.professional = '{}'.format(request.POST.get("professional", None))  # 专业
            if request.POST.get("password", None):
                obj.password = '{}'.format(request.POST.get("password", None))  # 密码
            obj.sex = '{}'.format(request.POST.get("sex", None))  # 账号
            obj.department = '{}'.format(request.POST.get("department", None))  # 院系
            obj.grade = '{}'.format(request.POST.get("grade", None))  # 年级
            obj.province = '{}'.format(request.POST.get("province", None))  # 省
            obj.province_detail = '{}'.format(request.POST.get("province_detail", None))  # 账号
            obj.hobby = '{}'.format(request.POST.get("hobby", None))  # 爱好
            obj.politics_status = '{}'.format(request.POST.get("politics_status", None))  # 政治面貌
            obj.phone = '{}'.format(request.POST.get("phone", None))  # 本人手机
            obj.family_card = '{}'.format(request.POST.get("family_card", None))  # 家庭联系方式
            obj.save()
            # user.save()
            # del request.session['user']
            return success("修改成功")


def teacher_manage(request):
    if request.method == 'GET':
        # 查看信息
        return render(request, 'select_class/admin/design_teacher.html')
    elif request.method == 'POST':
        # 表单上传
        # user = request.session['user']
        flag = request.POST.get("flag", None)  # 编辑0   新增1
        # 判断是新增还是编辑
        if int(flag) == 1:
            user_obj = TeacherInformation(number=request.POST.get("number", None),
                                          name=request.POST.get("name", None),
                                          password=request.POST.get("password", None)
                                         )
            user_obj.save()  # 对象调动save方法保存到数据库
            return success("新增成功")
        else:
            password = request.POST.get("password", None)
            obj = TeacherInformation.objects.get(number="{}".format(request.POST.get("number", None)))
            obj.number = '{}'.format(request.POST.get("number", None))  # 学号
            obj.name = '{}'.format(request.POST.get("name", None))  # 姓名
            obj.date_birth = '{}'.format(request.POST.get("date_birth", None))  # 姓名
            obj.province = '{}'.format(request.POST.get("province", None))  # 省
            obj.province_detail = '{}'.format(request.POST.get("province_detail", None))  # 市/县
            obj.politics_status = '{}'.format(request.POST.get("politics_status", None))  # 政治面貌
            obj.working_hours = '{}'.format(request.POST.get("working_hours", None))  # 政治面貌
            obj.professional = '{}'.format(request.POST.get("professional", None))  # 专业
            obj.education_level = '{}'.format(request.POST.get("education_level", None))  # 专业
            obj.track_record = '{}'.format(request.POST.get("track_record", None))  # 爱好
            if password:
                obj.password = '{}'.format(password)  # 密码
            # obj.sex = '{}'.format(request.POST.get("sex", None))  # 账号
            obj.department = '{}'.format(request.POST.get("department", None))  # 院系
            obj.phone = '{}'.format(request.POST.get("phone", None))  # 年级
            obj.save()
            # user.save()
            # del request.session['user']
            return success("修改成功")


def course_manage(request):
    if request.method == 'GET':
        # 查看信息
        return render(request, 'select_class/admin/design_class.html')
    elif request.method == 'POST':
        # 表单上传
        # user = request.session['user']
        flag = request.POST.get("flag")  # 编辑0   新增1
        # 判断是新增还是编辑
        if int(flag) == 1:
            user_obj = Course(course_number=request.POST.get("course_number", None),
                              course_name=request.POST.get("course_name", None),
                              type=request.POST.get("type", None),
                              class_day=request.POST.get("class_day", None),
                              class_times=request.POST.get("class_times", None),
                              class_hours=request.POST.get("class_hours", None),
                              credit=request.POST.get("credit", None),
                              number_optional=request.POST.get("number_optional", None),
                              teacher_id=int(request.POST.get("teacher_id", None)),
                              class_site=request.POST.get("class_place", None),
                              over_time=request.POST.get("over_time", None),
                              term=request.POST.get("term",None))
            user_obj.save()  # 对象调动save方法保存到数据库
            return success("新增成功")
        else:
            obj = Course.objects.get(id="{}".format(request.POST.get("id")))
            obj.course_number = '{}'.format(request.POST.get("course_number", None))  # 课程号
            obj.course_name = '{}'.format(request.POST.get("course_name", None))  # 课程名
            obj.type = '{}'.format(request.POST.get("type", None))  # 类型ABCDE
            obj.class_day = '{}'.format(request.POST.get("class_day", None))  # 上课时间
            obj.class_times = '{}'.format(request.POST.get("class_times", None))  # 上课时间
            obj.class_hours = '{}'.format(request.POST.get("class_hours", None))  # 时间段
            obj.class_site = '{}'.format(request.POST.get("class_place", None))  # 时间段
            obj.credit = '{}'.format(request.POST.get("credit", None))  # 学分
            obj.number_optional = '{}'.format(request.POST.get("number_optional", None))  # 人数限制
            obj.teacher_number = '{}'.format(request.POST.get("teacher_id", None))  # 教师id
            obj.over_time = '{}'.format(request.POST.get("over_time", None))  # 结束时间
            obj.publish_status = '{}'.format(request.POST.get("publish_status", 0))  # 发布状态0  未审核   1 已审核
            obj.save()
            # user.save()
            # del request.session['user']
            return success("修改成功")

def edit_grade(request):
    """修改成绩"""
    grade = request.POST.get('grade','')
    pid = request.POST.get('pid','')
    if grade and pid:
        Performance.objects.filter(id=pid).update(grade=grade)
        return success("修改成功")
    else:
        return fail("修改失败")


def performance_student(request):
    if request.method == 'GET':
        # 查看信息
        return render(request, 'select_class/student/select_class.html')
    elif request.method == 'POST':
        # 通过number获取id
        student = request.POST.get("student_number", None)
        course = request.POST.get("course_number", None)
        teacher = request.POST.get("teacher", None)
        student_id = StudentInformation.objects.filter(number=student)
        course_id = Course.objects.filter(course_number=course)
        teacher_id = TeacherInformation.objects.filter(id=teacher)
        # 表单上传
        # user = request.session['user']
        flag = request.POST.get("flag")  # 编辑0   新增1
        # 判断是新增还是编辑
        # if int(flag) == 1:
        user_obj = Performance(student_id=student_id[0].id,
                          course_id=course_id[0].id,
                          teacher_id=teacher_id[0].id)
        user_obj.save()  # 对象调动save方法保存到数据库
        return success("新增成功")
        # else:
        #     obj = Course.objects.get(student_number="{}".format(request.POST.get("student_number")))
        #     obj.course_number = '{}'.format(request.POST.get("course_number", None))  # 课程号
        #     obj.save()
        #     # user.save()
        #     # del request.session['user']
        #     return success("修改成功")


def logout(request):
    try:
        del request.session['admin']  # 不存在时报错
    except Exception as error:
        print('没有登陆', error)
    return HttpResponseRedirect('/manage/login')


# 学生
def student_get(request):
    student_number = request.POST.get("student_number")
    student_name = request.POST.get("student_name")
    sql = "SELECT * FROM student_information "
    if student_number is not None and student_number != '':
        sql += " where id=%d" % int(student_number)
    if student_name is not None and student_name != '':
        sql += " and name='%s'" % student_name
    user = findFisrt(sql)
    # 删除不需要显式的字段
    # user.pop('password')
    # user.pop('create_time')
    return success("获取成功", user)

# 学生
def student_getAll(request):
    user = findAll("SELECT * FROM student_information")
    # 删除不需要显式的字段
    # user.pop('password')
    # user.pop('create_time')
    return success("获取成功", user)



# 教师
def teacher_get(request):
    teacher_number = request.POST.get("teacher_number")
    if request.POST.get("number"):
        teacher_number = request.POST.get("number")
    teacher_name = request.POST.get("teacher_name")
    sql = "SELECT * FROM teacher_information "
    if teacher_number is not None and teacher_number != '':
        sql += " where id=%d" % int(teacher_number)
    if teacher_name is not None and teacher_name != '':
        sql += " and name='%s'" % teacher_name
    teacher = findFisrt(sql)
    # teacher.pop('date_birth')
    return success("获取成功", teacher)


# 教师
def teacher_getAll(request):
    teacher = findAll(
        "SELECT * FROM teacher_information")
    # teacher.pop('date_birth')
    return success("获取成功", teacher)


# 查看课程
def course_getAll(request):
    course = findAll("SELECT * FROM course where publish_status=1")
    # teacher.pop('date_birth')
    return success("获取成功", course)

# 查看课程
def course_getAlls(request):
    course = findAll("SELECT a.*,b.name FROM course a left join teacher_information b on a.teacher_id = b.number ")
    # teacher.pop('date_birth')
    return success("获取成功", course)

# 管理员查看所有课程信息
def get_allcourse(request):

    sql = '''SELECT course_number,course_name,type,class_day,class_hours,credit,number_optional,t.`name`,class_site,teacher_id 
    FROM course c
    LEFT JOIN teacher_information t ON t.number =c.teacher_id
    '''
    cursor = connection.cursor()
    cursor.execute(sql)
    course = cursor.fetchall()
    print(course)
    # teacher.pop('date_birth')
    return success("获取成功", course)


# 管理员删除课程
def del_onecourse(request):
    course_number = request.POST.get("number")
    print(course_number)
    Course.objects.filter(course_number = course_number).delete()
    return success("获取成功","success" )

# 管理员审批课程
def approve_courses(request):
    cn = request.POST.get("course_number")
    ps = request.POST.get("publish_status")
    c = Course.objects.filter(course_number=cn)[0]
    c.publish_status = ps
    c.save()
    return success("审批成功","success")

# 查看课程(未审核的课程)
def course_getAll_publish(request):
    course = findAll("SELECT c.*,t.name as teacher_name  FROM course as c left join teacher_information as t on t.number=c.teacher_number where publish_status=0 ")
    # teacher.pop('date_birth')
    return success("获取成功", course)

# 查看课程(未审核的课程)
def course_teacher(request):
    sql = "SELECT c.*,t.name as teacher_name  FROM course as c left join teacher_information as t on t.number=c.teacher_id where  c.teacher_id=%s " % request.POST.get("teacher_number",'')
    course = findAll(sql)
    # teacher.pop('date_birth')
    return success("获取成功", course)

# 查看成绩
def performance_getAll(request):
    tid = request.GET.get('tid', '')
    if tid !="0":
        p_query = Performance.objects.filter(Q(teacher_id=int(tid)))
    else:
        p_query = Performance.objects.all()
    if p_query:
        list_data = []
        for p in p_query:
            c_query = Course.objects.filter(id=p.course_id).first()
            s_query = StudentInformation.objects.filter(id=p.student_id).first()
            tmp_query = {"id": p.id, "number": s_query.number, "name": s_query.name,
                         "course_number": c_query.course_number, "course_name": c_query.course_name,
                         "type": c_query.type, "term": c_query.term, "grade": p.grade}
            list_data.append(tmp_query)


    # course = findAll(
    #     "SELECT c.course_number,c.course_name,c.type,c.credit,c.class_site,c.term,p.grade,t.name as teacher_name,t.phone as teacher_phone,s.name as student_name,s.number as student_number,s.phone as student_phone FROM performance as p left join student_information as s on s.id=p.student_id left join "
    #     "teacher_information as t on t.id=p.teacher_id left join course as c on c.id=p.course_id")
    # teacher.pop('date_birth')

    return success("获取成功", list_data)
# var number = "<td>"+item.number+"</td>" //学生学号
#                         var name = "<td>"+item.name+"</td>" //这里表示学生的姓名
#                         var course_number = "<td>"+item.course_number+"</td>" //课程号
#                         var course_name = "<td>"+item.course_name+"</td>" //课程名称
#                         var type = "<td>"+item.type+"</td>"//课程类型
#                         var term = "<td>"+item.term+"</td>"

# 查看成绩
def performance_teacher(request):
    # course = findAll(
    #     "SELECT c.course_number,c.course_name,c.type,c.credit,c.class_site,c.term,p.grade,t.name as teacher_name,t.phone as teacher_phone,s.name,s.number,s.phone as student_phone FROM performance as p left join student_information as s on s.id=p.student_id left join "
    #     "teacher_information as t on t.id=p.teacher_id left join course as c on c.id=p.course_id where c.teacher_id=%s"  % request.POST.get("teacher_number", None))
    # # teacher.pop('date_birth')
    tid = request.GET.get('tid','')
    list_data = []
    p_query = Performance.objects.filter(Q(teacher_id=tid),Q(grade=0) )
    if p_query:
        # list_data = []
        for p in p_query:
            c_query = Course.objects.filter(id=p.course_id).first()
            s_query = StudentInformation.objects.filter(id=p.student_id).first()
            tmp_query = {"id":p.id,"number":s_query.number,"name":s_query.name,"course_number":c_query.course_number,"course_name":c_query.course_name,"type":c_query.type,"term":c_query.term,"grade":p.grade}
            list_data.append(tmp_query)


    return success("获取成功", list_data)


# 查看个人成绩
def performance_get(request):
    sql = """SELECT c.course_number,c.course_name,c.type,c.credit,c.over_time,c.class_site,p.grade,t.name as teacher_name,t.phone as teacher_phone,s.name as 
          student_name,s.number as student_number,s.phone as student_phone FROM performance as p left join student_information as s on s.id=p.student_id left join 
        teacher_information as t on t.id=p.teacher_id left join course as c on c.id=p.course_id where p.student_id=%s """  % request.POST.get("number", None)
    course = findAll(
        sql)
    # teacher.pop('date_birth')

    return success("获取成功", course)


# 删除学生
def delStudent(request):
    # delete = find(
    #     "delete from student_information where id='%s'") % request.POST.get("number", None)
    # # teacher.pop('date_birth')
    # # return success("删除成功", delete)
    try:
        sql = "delete from student_information where id='%s'" % request.POST.get("number", None)
        # teacher.pop('date_birth')
        cursor = connection.cursor()
        cursor.execute(sql)
        cursor.close()
        return success("删除成功")
    except Exception as e:
        return fail("删除失败")

# 删除课程
def del_course(request):
    delete = find(
        "delete from course where course_number='%s'") % request.POST.get("course_number", None)
    # teacher.pop('date_birth')
    return success("删除成功", delete)

# 删除教师
def delTeacher(request):
    try:
        sql = "delete from teacher_information where id=%s" % request.POST.get("number", None)
        # teacher.pop('date_birth')
        cursor = connection.cursor()
        cursor.execute(sql)
        cursor.close()
        return success("删除成功")
    except Exception as e:
        return fail("删除失败")


# 后台主体
def index(request):
    return render(request, 'select_class/admin/admin.html',
                  {'show_type': 1, })



# # 上传图片
# def upload_image(request):
#     upload_photo = request.FILES['file']
#     if upload_photo is not None:
#         # 获取后缀名，没有考虑，上传的文件没有后缀的情况
#         ext_name = os.path.splitext(upload_photo.name)[-1]
#         # 生成时间戳+随机数字，用于重命名文件，防止文件重名
#         target_file_name = datetime.now().strftime('%Y%b%d%H%M%S') + str(random.randint(1000, 9999)) + ext_name
#         # target_file = open('D:/workspace/PyNetdisk/netdisk/static/avatar/' + target_file_name, 'wb+')
#         target_file = open(sys.path[0] + '/select_class/static/upload/' + target_file_name, 'wb+')
#         for chunk in upload_photo.chunks():
#             target_file.write(chunk)
#             # 关闭文件
#         target_file.close()
#
#         # 返回格式
#         # {
#         #   "code": 0 //0表示成功，其它失败
#         #   ,"msg": "" //提示信息 //一般上传失败后返回
#         #   ,"data": {
#         #     "src": "图片路径"
#         #     ,"title": "图片名称" //可选
#         #   }
#         # }
#         response = {
#             "code": 0,
#             "msg": "上传成功",
#             "data": {
#                 "src": "/static/upload/" + target_file_name,
#                 "title": target_file_name
#             }
#         }
#     else:
#         response = {
#             "code": 1,
#             "msg": "上传失败",
#         }
#     jsonString = json.dumps(response, ensure_ascii=False)
#     return HttpResponse(jsonString, content_type='application/json')
#
#
# # ===========================用户管理===========================
# @xframe_options_exempt
# def user(request):
#     return render(request, 'manage/user/user.html')
#
#
# def user_page(request):
#     # 处理查询条件
#     name = request.POST.get('name')
#     number = request.POST.get('number')
#
#     whereSql = 'FROM user WHERE 1=1'
#     if name:
#         whereSql + " AND name LIKE '%" + name + "%' "
#     if number:
#         whereSql + " AND number LIKE '%" + number + "%' "
#
#     data = page("SELECT id, name, number, DATE_FORMAT(create_time, '%Y-%m-%d') createTime",
#                 whereSql, request)
#     return success("获取成功", data)

#
#
# def user_save(request):
#     id = request.POST.get("id")
#     # 判断是新增还是编辑
#     if id:
#         user = User.objects.get(id=id)
#     else:
#         user = User()
#         user.create_time = datetime.now()
#
#     user.name = request.POST.get('name')
#     user.number = request.POST.get('number')
#
#     password = request.POST.get('password')
#     if password:
#         user.password = utils.get_md5(password)
#
#     user.save()
#
#     return success("保存成功")
#
#
# # def user_delete(request):
# #     id = request.POST.get("id")
# #     User.objects.filter(id=id).delete()
# #     return success("删除成功")
#



# def admin_save(request):
#     id = request.POST.get("id")
#     # 判断是新增还是编辑
#     if id:
#         admin = Admin.objects.get(id=id)
#     else:
#         admin = Admin()
#         admin.create_time = datetime.now()
#
#     admin.name = request.POST.get('name')
#     admin.number = request.POST.get('number')
#
#     password = request.POST.get('password')
#     if password:
#         admin.password = utils.get_md5(password)
#
#     admin.save()
#     return success("保存成功")
#

# 定义基础方法
def success(message, data=None):
    jsonString = json.dumps(Message.get_success_message(message, data), ensure_ascii=False,
                            default=lambda obj: obj.__dict__)
    return HttpResponse(jsonString, content_type='application/json')


def fail(message):
    return HttpResponse(Message.get_fail_message(message).to_json(), content_type='application/json')


# 分页
def page(selectSql, whereSql, request):
    pageNum = request.POST.get('pageNum')
    pageSize = request.POST.get('pageSize')
    start = (int(pageNum) - 1) * int(pageSize)
    pageSql = selectSql + ' ' + whereSql + ' LIMIT ' + str(start) + ', ' + pageSize

    countRecord = findFisrt('SELECT COUNT(1) DATA_COUNT ' + whereSql)

    page = {
        'list': find(pageSql),
        'totalRow': countRecord['DATA_COUNT']
    }
    return page


# 执行SQL，返回字典值列表
def find(sql):
    cursor = connection.cursor()
    cursor.execute(sql)
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]


# 获取第一条数据
def findFisrt(sql):
    list = find(sql)
    if len(list) == 0:
        return None
    return list[0]


# 获取全部数据
def findAll(sql):
    list = find(sql)
    return list


# 获取表的数据数量
def getTableCount(tableName):
    dic = findFisrt("SELECT COUNT(*) DATA_COUNT FROM " + tableName)
    return dic['DATA_COUNT']



def stu_bar_data(request):
    sql = "SELECT c.course_name, count(*) count FROM performance p left join course c on c.id=p.course_id  GROUP BY course_id "
    cursor = connection.cursor()
    cursor.execute(sql)
    ret = cursor.fetchall()
    print(ret)
    return success("获取成功", ret)
# 兴趣爱好
def stu_hobby_data(request):

    date = []
    java = 0
    python = 0
    hadoop = 0
    machine_learning = 0
    AI = 0

    sql = "SELECT hobby FROM student_information"
    cursor = connection.cursor()
    cursor.execute(sql)
    ret = cursor.fetchall()
    # print(ret)
    for one in ret:
        if one[0]:
            inner = json.loads((one[0]))
            for i in inner:
                if i=="java":
                    java+=1
                elif i=="python":
                    python+=1
                elif i=="机器学习":
                    machine_learning+=1
                elif i=="hadoop":
                    hadoop+=1
                else:
                    AI+=1
    date.append(java)
    date.append(python)
    date.append(hadoop)
    date.append(machine_learning)
    date.append(AI)
    order = (date)
    return success("获取成功", date)

def stu_china_data(request):
    sql = "SELECT province,count(1) FROM `student_information` GROUP BY province "
    cursor = connection.cursor()
    cursor.execute(sql)
    ret = cursor.fetchall()
    print(ret)
    return success("获取成功", ret)

def stu_scroe_data(request):
    sql = "SELECT grade,count(1) FROM `performance` p GROUP BY grade "
    cursor = connection.cursor()
    cursor.execute(sql)
    ret = cursor.fetchall()
    print(ret)
    return success("获取成功", ret)
