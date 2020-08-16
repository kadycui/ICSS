import json
import datetime


class Message(object):
    success = True
    message = ''
    data = None

    def __init__(self, success, message, data):
        self.success = success
        self.message = message
        self.data = data

    def to_json(self):
        #  ensure_ascii=False 用于防止将中文编程unicode
        return json.dumps({'success': self.success, 'message': self.message, 'data': self.data}, ensure_ascii=False)

    # 静态方法
    @classmethod
    def get_success_message(cls, message, data):
        return Message(True, message, data)

    @classmethod
    def get_fail_message(cls, message):
        return Message(False, message, None)
