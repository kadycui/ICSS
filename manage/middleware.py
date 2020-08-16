from django.http import HttpResponseRedirect


class LoginMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # 调用 view 之前的代码
        url = request.path
        # print('中间件拦截:' + url)
        # if not url.startswith('/manage/login') and url.startswith('/manage'):
        #     try:
        #         admin = request.session['admin']
        #     except Exception:
        #         print('未登录')
        #         return HttpResponseRedirect('/manage/login')

        # 调用 view 之后的代码
        response = self.get_response(request)
        return response
