import datetime
from django.http import HttpResponse
from django.shortcuts import render, redirect
import json
from .models import *

# Create your views here.


def index_views(request):
    return render(request,'index.html')

def query_views(request):
    users = User.objects.all()
    topics = Topic.objects.all()
    blogtypes = Blogtype.objects.all()
    categories = Category.objects.all()
    print(categories)
    return HttpResponse("Query OK")

def login_views(request):
    if request.method == 'GET':
        url = request.META.get("HTTP_REFERER", '/')
        # 判断id和loginnama是否存在于session中
        if 'id' in request.session and 'loginname' in request.session:
            # 如果存在,返回首页
            return redirect('/')
        else:
            # 判断id和loginname是否存在于cookies中,如果存在取出放入session中,在返回首页
            if 'id' in request.COOKIES and 'loginname' in request.COOKIES:
                id = request.COOKIES['id']
                loginname = request.COOKIES['loginname']
                request.session['id'] = id
                request.session['loginname'] = 'loginname'
                return redirect(url)
            else:
                # 否则返回登录页
                # 将url保存进cookies,以便POST使用
                resp = render(request,'login.html',locals())
                resp.set_cookie('url',url)
                return resp

    else:
        # 请求源地址
        url = request.META.get("HTTP_REFERER",'/')
        # 接收前端数据,查询数据库
        loginname = request.POST['username']
        upwd = request.POST['password']
        users = User.objects.filter(loginname=loginname,upwd=upwd)
        if users:
            # 登录成功.将id和loginname存入session
            id = users[0].id
            request.session['id'] = id
            request.session['loginname'] = loginname
            # 如果记住密码,保存进cookies,
            # 从cookies将URL的值获取出来
            url = request.COOKIES.get('url','/')
            resp = redirect(url)
            # 如果url存在于cookies中.删去
            if 'url' in request.COOKIES:
                resp.delete_cookie('url')
            if 'isSave' in request.POST:
                # 记住密码存入cookies
                expires = 60*60*24*366
                resp.set_cookie('id',id,expires)
                resp.set_cookie('loginname',loginname,expires)
            return resp
        else:
            # 登录失败,回到登录页
            return redirect('/login/')

def register_views(request):
    if request.method == 'GET':
        return render(request,'register.html')
    else:
        uname = request.POST['username']
        email = request.POST['email']
        url = request.POST['url']
        password = request.POST['password']
        User.objects.create(uname=uname,email=email,url=url,upwd=password)
        return redirect('/login/')

def check_login_views(request):
    # 判断id和loginname是否存在于session,如果存在有登录信息
    if 'id' in request.session and 'loginname' in request.session:
        id = request.session['id']
        loginname = User.objects.get(id=id).loginname
        # 将登录状态响应给前端
        dic = {
            'loginStatus':1,
            'loginname':loginname,
        }
    # 判断id和loginname是否存在于cookies中,如果存在取出数据保存进session
    elif 'id' in request.COOKIES and 'loginname' in request.COOKIES:
            id = request.COOKIES['id']
            loginname = request.COOKIES['loginname']
            request.session['id'] = id
            request.session['loginname'] = loginname
            dic = {
                'loginStatus':1,
                'loginname':loginname,
            }
    else:
        # 没有登录信息
        dic = {
            'loginStatus':0,
        }
    return HttpResponse(json.dumps(dic))

def logout_views(request):
    if 'id' in request.session and 'loginname' in request.session:
        del request.session['id']
        del request.session['loginname']
        # 获取源地址
        url = request.META.get('HTTP_REFERER','/')
        resp = redirect(url)
        # 判断cookies有则清除
        if 'id' in request.COOKIES and 'loginname' in request.COOKIES:
            resp.delete_cookie('id')
            resp.delete_cookie('loginname')
            return resp

        return redirect('/')

def release_views(request):
    if request.method == 'GET':
        # 判断登录/是否为作者
        if 'id' in request.session and 'loginname' in request.session:
            is_author = User.objects.filter(id=request.session['id'])
            if is_author != 1:
                return redirect('/')
            else:
                # 查询博客类型
                blogtypes = Blogtype.objects.all()
                # 查询文章类别
                categories = Category.objects.all()
                return render(request,'release.html',locals())
        else:
            # 去往登录页
            return redirect('/login/')
    else:
        # 将博客的信息保存进数据库
        title = request.POST['author']
        blogtype_id = request.POST['list']
        category_id = request.POST['category']
        user_id = request.session['id']
        content = request.POST['submit']
        pub_date = datetime.datetime.now().strftime("%Y-%m-%d")





