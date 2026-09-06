# Luật viết skill trong repo này

## Xưng hô

Chủ dự án là **Hoàng Ngọc Vương**, giám đốc VUTEX, Đà Nẵng.

- Trợ lý xưng **em**, gọi Vương là **anh**
- Không xưng "tôi", không gọi "bạn", không xưng "mình"

Riêng **nội dung bên trong các tệp `SKILL.md` và `README.md`** thì khác, vì
người đọc là học viên chứ không phải Vương. Trong đó xưng **bạn**, giọng hướng
dẫn, không xưng em anh.

## Giọng viết trong SKILL.md

- Câu ngắn, đi thẳng vào việc. Không mở bài, không tổng kết thừa
- **Không dùng gạch ngang dài, dấu chấm giữa, mũi tên, ô tick, biểu tượng cảnh
  báo.** Chỉ dùng chữ, dấu phẩy, dấu chấm và số
- Nói đến số thì viết bằng chữ số, không viết bằng chữ. "3 luật" chứ không phải
  "ba luật". Ngoại lệ duy nhất là khi số đóng vai mạo từ, "một cách khác"
- Không tự khen. Không hứa kết quả

## Luật riêng của bộ skill này

1. **Mỗi luật phải rút từ một lỗi thật.** Không thêm luật vì thấy nghe hay. Luật
   nào không chỉ ra được lỗi gốc thì bỏ
2. **Ghi luôn lỗi gốc vào skill.** Người đọc cần biết vì sao có luật đó, không
   thì họ bỏ qua
3. **Mỗi skill kết bằng danh sách tự kiểm.** Đó là phần chặn agent trả về bản
   đẹp mà rỗng
4. **Không bịa số, không bịa link.** Không tìm thấy thì ghi không tìm thấy

## Cấu trúc

Một skill là một thư mục, bên trong có một tệp `SKILL.md`, mở đầu bằng khối
`name` và `description`. Tên thư mục phải trùng với `name`.

`description` quyết định agent có nhận ra để đọc hay không. Viết rõ cả việc lẫn
câu nói kích hoạt.

Thêm skill mới là thêm thư mục, không sửa gì khác. Script cài tự quét.

## Chép của người khác

Repo này công khai và dùng giấy phép MIT.

Nếu thêm tệp nào **chép nguyên văn** từ dự án MIT của người khác thì tệp đó bắt
buộc giữ dòng bản quyền gốc, MIT ràng buộc chỗ đó. Viết lại bằng chữ mình thì
không cần, vì bản quyền không bảo vệ phương pháp, chỉ bảo vệ cách diễn đạt.

## Bảo mật

Repo này công khai. Không đưa vào đây khoá API, dữ liệu khách, số liệu kinh
doanh, hay bất cứ thứ gì thuộc repo riêng tư khác.
