"""select_class URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from django.contrib import admin
from front import views as front_views
from manage import views as manage_views

urlpatterns = [
    # 前台
    # path('', front_views.index),
    path('login', front_views.login),  # 登录
    # path('teacher_login', front_views.teacher_login),  # 登录
    path('teacher/change', front_views.change_teacher),  # 修改信息
    path('student/change', front_views.change_student),  # 修改信息
    # 学生主页
    path('student/class_manager', front_views.class_manager),  # 课程管理
    path('student/class_list', front_views.class_time_list),  # 个人课表
    path('student/query_score', front_views.query_score),  # 成绩查询
    path('student/personal_info', front_views.personal_info),  # 个人资料
    path('student/course_select', front_views.course_select),  # 课程查询
    path('student/rm_class', front_views.rm_class),  # 取消选课
    path('student/getCourse', front_views.getCourse),  # 相应number学号进行请求已选的课程
    path('student/select_class', front_views.select_class),  # 相应number学号进行请求已选的课程
    path('student/performance_student', manage_views.performance_student),  # 学生选课（学号课程编号）





    # 教师主页
    path('teacher_class_manager', front_views.teacher_class_manager),  # 课程管理
    path('my_class_list', front_views.my_class_list),  # 我的课表
    path('score_count', front_views.score_count),  # 成绩统计
    path('teacher_personal_manager', front_views.teacher_personal_manager),  # 教师完善信息
    path('see_score', front_views.see_score),  # 教师完善信息
    path('performance_teacher', manage_views.performance_teacher),  # 教师完善信息
    path('course_teacher', manage_views.course_teacher),  # 教师完善信息
    path('manage/user/stu_bar_data', manage_views.stu_bar_data),
    path('manage/user/stu_hobby_data', manage_views.stu_hobby_data),
    path('manage/user/stu_china_data', manage_views.stu_china_data),
    path('manage/user/stu_scroe_data', manage_views.stu_scroe_data),




    # 后台页面
    path('add_student', front_views.add_student),  # 课程管理
    path('design_student', front_views.design_student),  # 查看学生
    path('add_teacher', front_views.add_teacher),  # 新增教师
    path('design_teacher', front_views.design_teacher),  # 查看教师
    path('test_class', front_views.test_class),  # 审核课程
    path('design_class', front_views.design_class),  # 查看课程
    path('student_score', front_views.student_score),  # 查看成绩
    path('all_student_score', front_views.all_student_score),  # 查看所有成绩
    path('main', front_views.main),  # 大屏展示




    path('login/code', front_views.v_code),  # 发送验证码（带图片）
    path('login/student_index', front_views.student_index),  # 发送验证码（带图片）
    path('login/teacher_index', front_views.teacher_index),  # 发送验证码（带图片）
    path('login/admin_index', front_views.admin_index),  # 发送验证码（带图片）


    # # 后台管理
    path('manage', manage_views.index),
    # path('manage/login', manage_views.login),
    path('manage/logout', manage_views.logout),
    path('manage/user/getStudents', manage_views.student_getAll),  # 获取学生
    path('manage/user/getTeachers', manage_views.teacher_getAll),  #获取教师

    path('manage/user/getCourses', manage_views.course_getAll),  # 获取课程  审核通过的

    path('manage/admin/course_getAlls', manage_views.course_getAlls), # 获取课程  审核通过的
    path('manage/admin/getCourses_publish', manage_views.course_getAll_publish),  # 获取课程  审核通过的


    path('manage/user/getStudent', manage_views.student_get),  # 获取学生
    path('manage/user/getTeacher', manage_views.teacher_get),  # 获取教师
    path('manage/user/adminChange', manage_views.admin_change),  # 修改后台账号密码
    path('manage/user/getPerformance', manage_views.performance_getAll),  # 获取成绩
    path('manage/user/performance_get', manage_views.performance_get),  # 获取成绩

    path('manage/user/Student', manage_views.student_manage),  # 学生新增修改接口
    path('manage/user/againStudent', manage_views.student_again),  # 学生新增修改接口
    path('manage/user/Teacher', manage_views.teacher_manage),  # 教师新增修改接口
    path('manage/user/againTeacher', manage_views.teacher_again),  # 教师新增修改接口
    path('manage/user/Course', manage_views.course_manage),  # 课程新增修改接口
    path('manage/user/edit_grade', manage_views.edit_grade),  # 课程新增修改接口

    path('manage/user/add_class', front_views.add_class),  # 课程新增修改接口



    path('manage/admin/delStudent', manage_views.delStudent),  # 学生删除接口
    path('manage/admin/delTeacher', manage_views.delTeacher),  # 教师删除接口
    path('manage/user/del_course', manage_views.del_course),  # 课程删除接口


    path('manage/admin/get_allcourse', manage_views.get_allcourse),  # 查询所有课程信息
    path('manage/admin/del_onecourse', manage_views.del_onecourse),  # 管理员删除一个课程
    path('manage/admin/approve_courses', manage_views.approve_courses),  # 管理员审批课程





]
