# Sử dụng hình ảnh Ubuntu làm cơ sở
FROM ubuntu:20.04

# Cập nhật và cài đặt Apache, MySQL, PHP
RUN apt-get update && apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql

# Cài đặt các gói cần thiết khác
RUN apt-get install -y git unzip

# Sao chép mã nguồn ứng dụng vào thư mục của Apache
COPY . /var/www/html/

# Cấu hình Apache
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite

# Tạo một tệp khởi động để chạy Apache và MySQL
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Cấu hình để Apache lắng nghe trên cổng 80
EXPOSE 80

# Khởi động dịch vụ
ENTRYPOINT ["docker-entrypoint.sh"]
