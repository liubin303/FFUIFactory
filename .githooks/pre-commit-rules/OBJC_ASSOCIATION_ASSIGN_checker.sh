#!/bin/sh
#
# 检查提交内容是否使用了OBJC_ASSOCIATION_ASSIGN
# ARC下不推荐使用，可以换成OBJC_ASSOCIATION_RETAIN
# 


result=0

msg_color_error='\033[31m'
msg_color_success='\033[32m'
msg_color_warning='\033[33m'
msg_color_none='\033[0m'

echo "${msg_color_warning}Begin commit check ...${msg_color_none} \n"


if git diff-index -p -M --cached HEAD --  '*.h' '*.m' | grep '^+' | egrep "OBJC_ASSOCIATION_ASSIGN" >/dev/null 2>&1
then
  echo "${msg_color_error}🚫禁止使用OBJC_ASSOCIATION_ASSIGN${msg_color_none} \n"
  result=1
else 
  echo "${msg_color_success}OBJC_ASSOCIATION_ASSIGN check success${msg_color_none} \n"
fi


exit $result