primer5="${1}"
primer3="${2}"
agrep --show-position -E 3 "${primer5}" \
  | perl -F: -e '@_=split /-/,@F[0]; print substr(@F[1],@_[1])' \
  | agrep --show-position -E 3 "${primer3}" \
  | perl -F: -e '@_=split /-/,@F[0]; print substr(@F[1],0,@_[0]) . "\n"'
