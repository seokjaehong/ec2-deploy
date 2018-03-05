import mimetypes
import os
from django.http import FileResponse, HttpResponse

from config import settings
from config.settings import MEDIA_ROOT


def serve_media(request, path):
    # path에는 미디어 파일(User-uploaded files)의 경로
    # 주어진 미디어파일의 경로를 settings.MEDIA_ROOT를 기준으로
    # 해당 파일을 리턴 해주는 view 함수 작성
    # path = /media/photo/suji.jpg
    # print(path)

    # media_file = MEDIA_ROOT+'/'+path
    # response = FileResponse(open(media_file, 'rb'))
    # return response

    media_path = os.path.join(settings.MEDIA_ROOT, path)
    content_type = mimetypes.guess_type(path)

    return FileResponse(
        open(media_path, 'rb'),
        content_type=content_type,
    )
