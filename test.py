import pymysql
import re


conn = pymysql.connect(
    host = "134.175.49.155",
    user = "root",
    password = "root",
    database = "select_class",
    charset = "utf8",
    port = 3306,
)

cur = conn.cursor()


def seach_all(sql_str):
    cur.execute(sql_str)
    data = cur.fetchall()
    return data

#查询所有课程
course_sql = '''select * from course'''
all_course = seach_all(course_sql)
print(all_course)

number = input("输入学号:")

# 学生所选课程的类型
courseid_sql = ''' select type from  course c left join  performance p on p.course_id = c.course_number where p.student_id = %d''' % int(number)
all_type = seach_all(courseid_sql)
type_list = []
if len(all_type) > 1:
    print("循环开始")
else:
    all_type = all_type[0][0]
    type_list.append(all_type)
print(type_list)

# 获取学生爱好
stu_sql= '''select * from student_information where number=%d''' % int(number)
hobby = seach_all(stu_sql)[0][10]

list_hobby = eval(hobby)
print("学生的爱好是:",list_hobby,type(list_hobby))


# 筛选出学生未选类型的课程
n_course = []
for i in all_course:
    data = i
    for t in type_list:
        if data[3] != t:
            n_course.append(data)
        else:
            pass
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
            re_course.append(lc_name)

print(re_course)

cur.close()
conn.close()
