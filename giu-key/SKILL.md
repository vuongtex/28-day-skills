---
name: giu-key
description: Luật giữ khoá API và dữ liệu khách khi build sản phẩm đem bán. Chặn key lọt lên GitHub, chặn dữ liệu người thật lọt vào commit và ảnh chụp màn hình, và chốt hướng dòng tiền để không vướng giấy phép trung gian thanh toán. Kích hoạt khi chạm tới API key, tệp .env, trước khi commit hoặc push, khi chụp màn hình nộp bài, hoặc khi thiết kế luồng thu tiền.
---

# /giu-key

3 loại thứ dễ rò trong lúc build: khoá API, dữ liệu người thật, và dòng tiền.
Skill này chặn cả 3.

## Khoá API

### Luật, làm ngay từ commit đầu tiên

1. Khoá chỉ nằm trong tệp `.env`
2. `.env` phải nằm trong `.gitignore` **trước khi** commit lần đầu, không phải
   sau khi lỡ
3. Có tệp `.env.example` để trống giá trị, chỉ ghi tên biến, tệp này mới được
   đẩy lên

### Khi nói chuyện về khoá

Đưa **tên biến**, không đưa giá trị. Viết `KYMA_API_KEY` chứ không dán chuỗi
thật, kể cả trong chat, trong ảnh chụp màn hình, trong mô tả lỗi.

Cần dán đoạn lỗi có chứa khoá thì che phần giữa trước khi dán.

### Lỡ đẩy khoá lên rồi

**Xoay khoá, đừng xoá commit.**

Vào trang quản lý của nhà cung cấp, huỷ khoá cũ, tạo khoá mới. Xoá commit
không cứu được, vì khoá đã nằm trong lịch sử, trong bản sao của người khác,
và trong bộ quét tự động của kẻ xấu chỉ vài phút sau khi đẩy lên.

### Trước khi push, quét một lượt

```bash
git diff --cached --name-only
```

Nhìn danh sách tệp. Thấy `.env`, thấy tệp dữ liệu, thấy `node_modules` là dừng
lại xử lý.

## Dữ liệu người thật

Tệp lead, danh sách học viên, kết quả chạy, đều chứa tên, email, số điện thoại
của người thật.

### Luật

- Toàn bộ thư mục dữ liệu và thư mục kết quả nằm trong `.gitignore`
- Chỉ đẩy lên tệp mẫu dùng **dữ liệu bịa**, và ghi rõ trong tài liệu là dữ liệu bịa
- Ảnh chụp màn hình để nộp bài hoặc đăng lên mạng: **che email và số điện thoại**
- Đang chia sẻ màn hình mà mở tệp dữ liệu thật là đã lộ, không rút lại được

### Mẫu .gitignore tối thiểu

```
.env
.env.local
*.key
data/*.csv
!data/mau-*.csv
out/
node_modules/
```

Dòng có dấu chấm than là ngoại lệ, cho phép đẩy đúng tệp mẫu.

## Dòng tiền, chỗ ít người nghĩ tới nhưng nặng nhất

Nếu sản phẩm của bạn giúp người khác thu tiền, có một câu phải trả lời trước
khi viết dòng mã đầu tiên:

> **Tiền của khách hàng cuối có đi qua tài khoản của bạn không?**

### Nếu có

Đó là hoạt động thu hộ chi hộ, và nhiều khả năng cần **giấy phép trung gian
thanh toán** do cơ quan quản lý tiền tệ nước sở tại cấp, ở Việt Nam là Ngân hàng
Nhà nước. Đây là rào cản pháp lý nặng, không giải được bằng cách viết mã.

### Nếu không

Mỗi người bán tự gắn tài khoản ngân hàng và tài khoản cổng nhận tiền của chính
họ. Tiền đi thẳng từ người mua vào tài khoản người bán. Hệ thống của bạn chỉ
**đọc tín hiệu báo có** để mở quyền, không bao giờ nằm trên đường đi của tiền.

**Chọn hướng thứ 2.** Nó cũng là hướng phần lớn nền tảng đang đi, và nó có
thêm một lợi ích: bạn không phải trả phí giao dịch, vì mỗi người bán dùng hạn
mức miễn phí của chính họ.

Cái giá phải trả: thêm một bước lúc người bán mới vào, họ phải tự tạo tài khoản
cổng nhận tiền. Với nhóm khách sợ kỹ thuật thì đây là chỗ dễ rơi nhất, nên phải
viết hướng dẫn từng bước có ảnh.

## Trước khi push, tự kiểm

- [ ] `.env` nằm trong `.gitignore` và không có trong danh sách tệp sắp commit
- [ ] Không có tệp dữ liệu thật nào trong danh sách sắp commit
- [ ] `.env.example` chỉ có tên biến, không có giá trị
- [ ] Ảnh chụp màn hình đã che email và số điện thoại
- [ ] Nếu sản phẩm chạm tới tiền: đã chốt tiền không đi qua tài khoản của mình

## Skill này phải tự tốt lên

Sau mỗi lần chạy, tự chấm theo danh sách trên. Gặp tình huống skill chưa che
thì đề xuất cập nhật thẳng vào tệp này. Chuyện pháp lý và giấy phép thì nói
thẳng là ngoài tầm và chỉ người dùng đi hỏi luật sư, đừng đoán.
