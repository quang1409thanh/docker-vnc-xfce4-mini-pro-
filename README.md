# docker-vnc-xfce4-mini-pro-
1. chay `docker-compose up`
2. sau khi build và chạy container thành công thì gõ lệnh `docker-compose exec app bash`
 sau đó ở `/var/www#` gõ các lệnh như sau 
    - touch /root/.Xresources
    - apt-get install dbus-x11
    - apt-get install x11-xserver-utils`
    - export USER=root
3. vào `vnc-viewer` xem dự án bằng địa chỉ `localhost:5901`
4. link demo https://youtube.com/live/L0XxI_SPIfA?feature=share
