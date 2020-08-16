from django.http import HttpResponseRedirect


class FrontLoginMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # 调用 view 之前的代码
        url = request.path
        # print('Front中间件拦截:' + url)
        # if needLogin(url):
        #     try:
        #         user = request.session['user']
        #     except Exception:
        #         print('未登录')
        #         return HttpResponseRedirect('/login')

        # 调用 view 之后的代码
        response = self.get_response(request)
        return response


# 判断是否需要登录
def needLogin(url):
    if url == '/article/save':
        return True
    if url.startswith('/me'):
        return True
    return False
