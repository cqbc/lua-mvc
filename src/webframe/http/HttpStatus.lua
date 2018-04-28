--
-- Created by IntelliJ IDEA.
-- User: lizhitao
-- Date: 2017/6/27
-- Time: 下午1:38
-- To change this template use File | Settings | File Templates.
--
local HttpStatus = {
    ['SC_OK'] = { code = 200, codeMsg = 'OK' },
    ['SC_CREATED'] = { code = 201, codeMsg = 'Created' },
    ['SC_BAD_REQUEST'] = { code = 400, codeMsg = 'Bad Request' },
    ['SC_UNAUTHORIZED'] = { code = 401, codeMsg = 'Unauthorized' },
    ['SC_NOT_FOUND'] = { code = 404, codeMsg = 'Not Found' },
    ['SC_PAYLOAD_TOO_LARGE'] = { code = 413, codeMsg = 'Payload Too Large' },
    ['SC_UNSUPPORTED_MEDIA_TYPE'] = { code = 415, codeMsg = 'Unsupported Media Type' },
    ['SC_UNPROCESSABLE_ENTITY'] = { code = 422, codeMsg = 'Unprocessable Entity' },
    ['SC_INTERNAL_SERVER_ERROR'] = { code = 500, codeMsg = 'Internal Server Error' }
}

return HttpStatus
