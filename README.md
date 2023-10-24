# Login

1. Nhập email + password để đăng nhập và thực hiện các quyền

![img_2.png](images/img_13.png)

# User
2.1. Nếu là user sẽ hiện thông tin và role của user đó

![img.png](images/img.png)

# Admin

2.2 Nếu là admin sẽ hiển thị các thao tác xử lý

![img_1.png](images/img_1.png)

3. Click vào từng chức năng để thao tác

# Account

![img_2.png](images/img_2.png)

4. Thực hiện nhập thông tin và nhấn button Add -> Đưa dữ liệu xuống database
![img_3.png](images/img_3.png)

5. Khi nhấn delete ở một row -> Lấy account_id của row đó -> setStatus = 0

![img_4.png](images/img_4.png)

6. Khi nhấn update

![img_5.png](images/img_5.png)

Lấy account_id của row đã chọn gán mặc định cho ô và để chế độ readonly -> Sau khi nhập thông tin cần đổi nhấn Update

![img_6.png](images/img_6.png)

# Role
![img_7.png](images/img_7.png)

# Grant Access
7. Mặc định là hiển thị danh sách account có role là user. Nếu muốn thay đổi -> Chọn select option mong muốn và nhấn Change
![img_8.png](images/img_8.png)

![img_9.png](images/img_9.png)

# Logs
Danh sách tất cả account đã login và logout
![img_10.png](images/img_10.png)

# Logout

Khi nhấn LogOut -> Quay về trang Login và đưa dữ liệu xuống database
![img_11.png](images/img_11.png)

Lần đăng nhập thực hiện mới đây
![img_12.png](images/img_12.png)