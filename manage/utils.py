import hashlib


# 获取MD5
def get_md5(string):
    return hashlib.md5(string.encode(encoding='UTF-8')).hexdigest()
