import random
from datetime import datetime

from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render


import manage.utils as utils
from front.utils import course_rec
from manage import views as manage_view
from manage.models import Course, Performance, StudentInformation, TeacherInformation, Admin
from manage.views import fail, success


def login(request):
    if request.method == 'GET':
        return render(request, 'select_class/login.html')
    elif request.method == 'POST':
        permission = request.POST.get('permission')
        number = request.POST.get('number')
        password = request.POST.get('password')
        print(permission, number, password)
        if permission == "1":
            # password = utils.get_md5(request.POST['password'])
            user = None
            try:
                user = StudentInformation.objects.get(number=number, password=password)
            except Exception as error:
                print('账号或者密码错误', error)
            if user is None:
                return fail('账号或者密码错误')
            # 登陆成功
            # request.session['user'] = user
            return success('登录成功', data=user.get_dict())
        if permission == "2":
            user = None
            try:
                user = TeacherInformation.objects.get(number=number, password=password)
                # request.session['user'] = user
            except Exception as error:
                print('账号或者密码错误', error)
            if user is None:
                return fail('账号或者密码错误')
            # 登陆成功

            return success('登录成功', data=user.get_dict())
        if permission == "3":
            admin = None
            try:
                admin = Admin.objects.get(account=number, password=password)
                # request.session['user'] = admin
            except Exception as error:
                print('账号或者密码错误', error)

            if admin is None:
                return fail('账号或者密码错误')
            # 登陆成功
            # request.session['admin'] = admin
            return success('登录成功', data=admin)
        return fail('账号或者密码错误')

def student_index(request):
    if request.method == 'GET':
        return render(request, 'select_class/student/index.html')


# 课程管理
def class_manager(request):
    if request.method == 'GET':
        return render(request, 'select_class/student/class_manager.html')

# 教师课程管理
def teacher_class_manager(request):
    if request.method == 'GET':
        return render(request, 'select_class/teacher/class_manager.html')
# 我的课程
def my_class_list(request):
    if request.method == 'GET':

        return render(request, 'select_class/teacher/my_class_list.html')
# 成绩统计
def score_count(request):
    if request.method == 'GET':

        return render(request, 'select_class/teacher/score_count.html')


# 完善信息
def teacher_personal_manager(request):
    if request.method == 'GET':
        return render(request, 'select_class/teacher/personal_manager.html')

# 个人课表
def class_time_list(request):
    if request.method == 'GET':
        return render(request, 'select_class/student/class_time_list.html')

# 成绩查询
def query_score(request):
    if request.method == 'GET':
        return render(request, 'select_class/student/query_score.html')

# 个人资料
def personal_info(request):
    if request.method == 'GET':
        return render(request, 'select_class/student/personal_info.html')


def select_class(request):
    if request.method == 'GET':
        return render(request, 'select_class/student/select_class.html')


# 添加学生
def add_student(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/add_student.html')


# 查看学生
def design_student(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/design_student.html')

import json
# 添加教师
def add_teacher(request):
    if request.method == 'GET':
        number = request.GET.get('title','')
        pwd = request.GET.get('password','')

        #     return HttpResponse(json.dumps({'code':-1,"msg":"parms valid"}))
        if all([number, pwd]):
            model = TeacherInformation.objects.filter(number=number).first()
            if not model:
                new_model = TeacherInformation()
                new_model.number = number
                new_model.password = pwd
                new_model.save()

        return render(request, 'select_class/admin/add_teacher.html')

# 查看教师
def design_teacher(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/design_teacher.html')

# 添加课程
def add_class(request):
    if request.method == 'GET':
        cid = request.GET.get('cid', None)
        model = None
        flag = 1
        if cid is not None:
            if Course.objects.filter(id=int(cid)).exists():
                model = Course.objects.filter(id=int(cid)).first()
                flag = 0

        return render(request, 'select_class/teacher/add_class.html',context={"model":model,"flag":flag})

# 查看成绩
def see_score(request):
    if request.method == 'GET':
        return render(request, 'select_class/teacher/see_score.html')

# 审核课程
def test_class(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/test_class.html')

# 查看课程
def design_class(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/design_class.html')

# 查看成绩
def student_score(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/student_score.html')

# 查看所有成绩
def all_student_score(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/all_student_score.html')
# 折线图
def main(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/main.html')



def teacher_index(request):
    if request.method == 'GET':
        return render(request,'select_class/teacher/index.html')

def admin_index(request):
    if request.method == 'GET':
        return render(request, 'select_class/admin/admin.html')





def change_student(request):
    if request.method == 'GET':
        # 查看信息
        return render(request, 'select_class/student/personal_info.html')
    elif request.method == 'POST':
        # 表单上传
        # user = request.session['user']
        number = request.POST.get("number", None)
        obj = StudentInformation.objects.get(number="{}".format(number))
        obj.family_card = '{}'.format(request.POST.get("family_card", None))   # 家庭联系方式
        obj.name = '{}'.format(request.POST.get("name", None))  # student_name
        print(request.POST['name'])
        obj.phone = '{}'.format(request.POST.get("phone", None))  # 手机号
        obj.politics_status = '{}'.format(request.POST.get("politics_status", None))  # 政治面貌
        obj.hobby = '{}'.format(request.POST.get("hobby", None))  # 爱好
        obj.province = '{}'.format(request.POST.get("province", None))  # 籍贯省
        obj.province_detail = '{}'.format(request.POST.get("province_detail", None))  # 籍贯市
        obj.grade = '{}'.format(request.POST.get("grade", None))    # 年级
        obj.department = '{}'.format(request.POST.get("department", None))  # 院系
        obj.sex = '{}'.format(request.POST.get("sex", None))  # 性别
        obj.professional = '{}'.format(request.POST.get("professional", None))  # 性别
        obj.save()
        # user.save()
        # del request.session['user']
        return success("修改成功")


# def teacher_login(request):
#     if request.method == 'GET':
#         return render(request, 'select_class/teacher/login.html')
#     elif request.method == 'POST':
#         number = request.POST['number']
#         # password = utils.get_md5(request.POST['password'])
#         password = request.POST['password']
#         user = None
#         print(number, password)
#         try:
#             user = TeacherInformation.objects.get(number=number, password=password)
#         except Exception as error:
#             print('账号或者密码错误', error)
#
#         if user is None:
#             return fail('账号或者密码错误')
#         # 登陆成功
#         request.session['user'] = user
#         return success('登录成功', data=user)

#
def change_teacher(request):
    if request.method == 'GET':
        # 查看信息
        return render(request, 'select_class/teacher/personal_info.html')
    elif request.method == 'POST':
        # 表单上传
        user = request.session['user']
        number = request.POST.get("number")
        obj = TeacherInformation.objects.get(number="{}".format(number))
        obj.date_birth = '{}'.format(request.POST.get("date_birth"))  # 家庭联系方式
        obj.name = '{}'.format(request.POST.get("name"))  # student_name
        obj.phone = '{}'.format(request.POST.get("phone"))  # 手机号
        obj.politics_status = '{}'.format(request.POST.get("politics_status"))  # 政治面貌
        obj.working_hours = '{}'.format(request.POST.get("working_hours"))  # 经验（年）
        obj.province = '{}'.format(request.POST.get("province"))  # 籍贯省
        obj.province_detail = '{}'.format(request.POST.get("province_detail"))  # 籍贯市
        obj.track_record = '{}'.format(request.POST.get("track_record"))  # 职称
        obj.department = '{}'.format(request.POST.get("department"))  # 院系
        obj.sex = '{}'.format(request.POST.get("sex"))  # 性别
        obj.professional = '{}'.format(request.POST.get("professional"))  # 性别
        obj.save()
        user.save()
        del request.session['user']
        return success("修改成功")


# # ===========================用户服务===========================



def logout(request):
    try:
        del request.session['user']  # 不存在时报错
    except Exception as error:
        print('没有登陆', error)
    return HttpResponseRedirect('/manage/login')


# 个人课表对比后的所有课表的
def course_select(request):
    stu_id = request.POST.get("student_number")
    sel_course = course_rec(stu_id)

    print(sel_course)

    return success("查询成功", sel_course)


# 相应number学号进行请求已选的课程
def getCourse(request):
    sql = """select b.*,c.name from 
        (select course_id,teacher_id from performance where student_id = %s ) a   LEFT JOIN       
        (select * from course) b        
        ON a.course_id = b.id  LEFT JOIN  (select id,name from teacher_information) c ON a.teacher_id = c.id""" % request.POST.get("number")
    res = find(
        sql )
    # teacher.pop('date_birth')
    return success("查询成功", res)



# 删除选课
def rm_class(request):
    course_number = request.POST.get("course_number", None)
    student = request.POST.get("student_number", None)
    if course_number:
        course = find(
            "select id from course where course_number=%s" % course_number
        )

    Performance.objects.filter(course_id = course[0]["id"],student_id=student).delete()

    return success("删除成功")




#
#
# def register(request):
#     if request.method == 'GET':
#         # 查看信息
#         return render(request, 'front/register.html')
#     if request.method == 'POST':
#         form = RegisterForm(request.POST)
#         if form.is_valid():
#             name = form.cleaned_data['name']
#             number = form.cleaned_data['number']
#             password = form.cleaned_data['password']
#             # 查询一下这个邮箱有没被注册过
#             try:
#                 User.objects.get(number=number)
#                 return fail('号码已经被注册')
#             except Exception as error:
#                 print('没有注册', error)
#
#             user = User()
#             user.name = name
#             user.number = number
#             user.password = utils.get_md5(password)
#             user.create_time = datetime.now()
#             user.save()
#             return success('注册成功')
#
#
# def change_info(request):
#     if request.method == 'GET':
#         return render(request, 'front/me/change-info.html', {'user': request.session['user']})
#     elif request.method == 'POST':
#         user = request.session['user']
#         user.name = request.POST['name']
#         user.number = request.POST['number']
#         user.save()
#
#         request.session['user'] = user
#         return success("更新成功")
#

# 上传图片
def upload_image(request):
    return manage_view.upload_image(request)


# 定义基础方法
def success(message, data=None):
    return manage_view.success(message, data)


def fail(message):
    return manage_view.fail(message)


# 分页
def page(selectSql, whereSql, request):
    return manage_view.page(selectSql, whereSql, request)


# 执行SQL，返回字典值列表
def find(sql):
    return manage_view.find(sql)


# 获取第一条数据
def findFisrt(sql):
    return manage_view.findFisrt(sql)

#
# # 保存攻略接口
# def ancient_save(request):
#     if request.method == 'GET':
#         # 查看信息
#         return render(request, 'front/article/ancient_save.html')
#     elif request.method == 'POST':
#         id = request.POST.get("id")
#         # 判断是新增还是编辑
#         if id:
#             article = Article.objects.get(id=id)
#         else:
#             user = request.session['user']
#
#             article = Article()
#             article.user_id = user.id
#             article.scenic_id = int(request.POST.get('scenicId'))
#             article.create_time = datetime.now()
#
#         article.title = request.POST.get('title')
#         article.text = request.POST.get('text')
#         article.content = request.POST.get('content')
#         article.save()
#
#         return success("保存成功", article.id)


import random
from PIL import Image, ImageDraw, ImageFont
def v_code(request):
    def random_color():
        return random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)

    #     创建一个随机颜色的图片对象
    img_obj = Image.new('RGB', (250, 30), random_color())
    #     实例化一个画笔对象
    pen_obj = ImageDraw.Draw(img_obj)
    #     加载字体对象
    font_obj = ImageFont.truetype('front/static/fonts/mui.ttf', 28)
    tmp = []
    for i in range(5):
        l = chr(random.randint(97, 122))  # 生成随机的小写字母
        u = chr(random.randint(65, 90))  # 生成随机的大写字母
        n = str(random.randint(0, 9))  # 生成一个随机的数字
        # 从上面三个随机选一个
        r = random.choice([l, u, n])
        pen_obj.text((40 * i + 30, 0), r, fill=random_color(), font=font_obj)
        tmp.append(r)
    print(tmp)
    v_code = ''.join(tmp).upper()
    request.session['v_code'] = v_code

    from io import BytesIO
    f1 = BytesIO()
    img_obj.save(f1, format="PNG")
    img_data = f1.getvalue()
    request.session['code'] = tmp
    return HttpResponse(img_data, content_type="image/png")

