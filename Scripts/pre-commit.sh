#!/usr/bin/env bash
set -eux

result=0
msg_color_error='\033[1;31m'
msg_color_yellow='\033[0;33m'
msg_color_none='\033[0m' # No Color

echo -en "${msg_color_yellow}Begin commit check ...${msg_color_none} \n"

# format check
test_pattern='[NSString stringWithFormat:@"%.1f"'
if git diff-index -p -M --cached HEAD -- '*.m' | grep '^+' | egrep "$test_pattern" >/dev/null 2>&1
then
  echo "包含不安全的format方法:$test_pattern" >&2
  echo "请修改后在提交." >&2
  echo '----' >&2
  git grep -E "$test_pattern" '*.h' '*.m'  >&2
  echo '----' >&2
  failed=1
fi

exit $result
