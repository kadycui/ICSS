# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Admin(models.Model):
    account = models.CharField(max_length=255, blank=True, null=True)
    premission = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    sex = models.CharField(max_length=255, blank=True, null=True)
    user_name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'admin'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Course(models.Model):
    course_number = models.IntegerField(blank=True, null=True)
    course_name = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=255, blank=True, null=True)
    class_day = models.CharField(max_length=255, blank=True, null=True)
    class_hours = models.CharField(max_length=255, blank=True, null=True)
    credit = models.CharField(max_length=255, blank=True, null=True)
    number_optional = models.IntegerField(blank=True, null=True)
    teacher_id = models.IntegerField(blank=True, null=True)
    publish_status = models.IntegerField(blank=True, null=True, default=0)
    class_site = models.CharField(max_length=255, blank=True, null=True)
    term = models.CharField(max_length=255, blank=True, null=True) # 开学学年
    over_time = models.CharField(max_length=255, blank=True, null=True)
    class_times = models.CharField(max_length=255, blank=True, null=True)  # 学时

    class Meta:
        managed = False
        db_table = 'course'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Performance(models.Model):
    course_id = models.IntegerField(blank=True, null=True)
    student_id = models.IntegerField(blank=True, null=True)
    grade = models.CharField(max_length=255, blank=True, null=True,default=0)
    teacher_id = models.IntegerField(blank=True, null=True)
    flag = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'performance'


class StudentInformation(models.Model):
    number = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    professional = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    sex = models.CharField(max_length=255, blank=True, null=True)
    department = models.CharField(max_length=255, blank=True, null=True)
    grade = models.CharField(max_length=255, blank=True, null=True)
    province = models.CharField(max_length=255, blank=True, null=True)
    province_detail = models.CharField(max_length=255, blank=True, null=True)
    hobby = models.CharField(max_length=255, blank=True, null=True)
    politics_status = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    family_card = models.CharField(max_length=255, blank=True, null=True)

    def get_dict(self):
        return {"id":self.id,
                "name":self.name,
                "professional":self.professional,
                "number":self.number,
                "grade":self.grade,
                "politics_status":self.politics_status,
                "province":self.province,
                "province_detail":self.province_detail,
                "password":self.password,
                "sex":self.sex,
                "department":self.department,
                "phone":self.phone,
                "hobby":self.hobby,
                "family_card":self.family_card}

    class Meta:
        managed = False
        db_table = 'student_information'


class TeacherInformation(models.Model):
    number = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    date_birth = models.CharField(max_length=255, blank=True, null=True)
    province = models.CharField(max_length=255, blank=True, null=True)
    province_detail = models.CharField(max_length=255, blank=True, null=True)
    politics_status = models.CharField(max_length=255, blank=True, null=True)
    working_hours = models.CharField(max_length=255, blank=True, null=True)
    professional = models.CharField(max_length=255, blank=True, null=True)
    track_record = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    sex = models.CharField(max_length=255, blank=True, null=True)
    department = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    permission = models.IntegerField(blank=True, null=True,default=2)
    education_level = models.CharField(max_length=255, blank=True, null=True)

    def get_dict(self):
        return {'id':self.id,
                'name':self.name,
                'date_birth':self.date_birth,
                'province':self.province,
                'number':self.number,
                'province_detail':self.province_detail,
                "politics_status":self.politics_status,
                "professional":self.professional,
                "track_record":self.track_record,
                "password":self.password,
                "sex":self.sex,
                "department":self.department,
                "phone":self.phone,
                "permission":self.permission,
                "working_hours":self.working_hours,
                "education_level":self.education_level}

    class Meta:
        managed = False
        db_table = 'teacher_information'
