FROM metabase/metabase
ADD repositories /etc/apk/repositories
RUN apk update && apk add curl bash tree tzdata \
    && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime
#set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

VOLUME ["/database"]
ENV MB_DB_FILE /database/metabase.db
ENV MB_JETTY_HOST 0.0.0.0
EXPOSE 3000
