FROM daocloud.io/php:5.6-apache

# 安装环境
RUN apt-get update \  
    && apt-get install -y \
        git \
        vim \
        wget \
        curl \
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf "/var/lib/apt/lists/*" \
    && rm -rf "/tmp/*" \
    && rm -rf "/var/tmp/*" \

    # 开启 URL 重写模块
    && a2enmod rewrite \  
    && mkdir -p /app \
    && rm -fr /var/www/html \
    && ln -s /app /var/www/html \

WORKDIR /app

