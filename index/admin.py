from django.contrib import admin
from .models import *

# Register your models here.
# 定义高级管理类
class CategoryAdmin(admin.ModelAdmin):
    # 定义在列表页中要显示的字段
    list_display = ('cate_name',)

class UserAdmin(admin.ModelAdmin):
    list_display = ('loginname','uname','email','is_author')


class BlogtypeAdmin(admin.ModelAdmin):
    list_display = ('type_name',)

class TopicAdmin(admin.ModelAdmin):
    list_display = ('title','pub_date','read_num','content')



admin.site.register(Category,CategoryAdmin)
admin.site.register(User,UserAdmin)
admin.site.register(Blogtype,BlogtypeAdmin)
admin.site.register(Topic,TopicAdmin)
admin.site.register(Reply)
admin.site.register(Voke)
