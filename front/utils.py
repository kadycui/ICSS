import json

from django.db import connection
import re

# 课程推荐
from manage.models import Course


def course_rec(stuid):
    cur = connection.cursor()
    id = int(stuid)

    def seach_all(sql_str):
        cur.execute(sql_str)
        data = cur.fetchall()
        return data

    num_sql = '''select number from student_information where id = %d''' % id
    number = seach_all(num_sql)[0][0]
    print(number)


    #查询所有课程
    course_sql = '''select * from course'''
    all_course = seach_all(course_sql)
    print(all_course)

    # 学生所选课程的类型
    courseid_sql = ''' select type from  course c left join  performance p on p.course_id = c.id where p.student_id = %d''' % int(stuid)
    all_type = seach_all(courseid_sql)
    type_list = []
    if len(all_type) > 1:
        print("循环开始")
        for ser in all_type:
            type_list.append(ser[0])
    elif len(all_type) ==1:
        all_type = all_type[0][0]
        type_list.append(all_type)
    else:
        pass
    print(type_list)
    aa = ""
    if type_list:
        bb = 1
        for t in type_list:
            if bb < len(type_list):
                aa = aa + r'"'+ t + r'"'+ ","
                bb += 1
            else:
                aa = aa + r'"'+ t + r'"'

    # 获取学生爱好
    stu_sql= '''select * from student_information where number=%d''' % int(number)
    list_hobby = []

    hobby = seach_all(stu_sql)[0][10]
    if hobby:
        list_hobby = eval(hobby)
        print("学生的爱好是:",list_hobby,type(list_hobby))


    #
    n_course = []
    for i in all_course:
        data = i
        # for t in type_list:
            # if data[3] != t:
            #     n_course.append(data)
            # else:
            #     pass
        if data[3] not in type_list:
            n_course.append(data)
    print(n_course)

    # 正则匹配爱好中的课程
    re_course = []
    for h in list_hobby:
        re_h = h.lower()
        print(re_h)
        for n in n_course:
            c_name = n
            lc_name =c_name[2].lower()
            match = re.search(re_h, lc_name)
            if match != None:
                re_course.append(lc_name.upper())
    print(re_course,type(re_course),len(re_course))

    if len(re_course) == 1:
        sql1 = """select a.*,b.name from course  a left join teacher_information b on
                    a.teacher_id = b.id where course_name = '%s' """% re_course[0]
        sql2 = """select a.*,b.name from course  a left join teacher_information b on
                    a.teacher_id = b.id where course_name!='%s' """% re_course[0]
        if aa:
            order =  """and type not in (%s)""" % aa
            sql1 += order
            sql2+=order

    elif len(re_course ) >1:
        l = ""
        a = 1
        for r in re_course:
            if a < len(re_course):
                l =l+ r'"' +r + r'"'+ ","
                a +=1
            else:
                l = l + r'"' +r + r'"'
        sql1 = """select a.*,b.name from course  a left join teacher_information b on
                    a.teacher_id = b.id where course_name in (%s)  """ % l
        sql2 = """select a.*,b.name from course  a left join teacher_information b on
                    a.teacher_id = b.id where course_name not in (%s) """ % l
        if aa:
            order =  """and type not in (%s)""" % aa
            sql1 += order
            sql2+=order
    else:
        sql1 = """select a.*,b.name from course  a left join teacher_information b on
                            a.teacher_id = b.id """
        sql2 = ""
        if aa:
            order =  """where type not in (%s)""" % aa
            sql1 += order

    ab = findcouse(sql1)
    if sql2:
        ac = findcouse(sql2)
        result = ab + ac
    else:
        result = ab
    return result
def findcouse(sql):
    cursor = connection.cursor()
    cursor.execute(sql)
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]


