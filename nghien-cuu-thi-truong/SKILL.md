---
name: nghien-cuu-thi-truong
description: Nghiên cứu một thị trường trước khi build, ra bản một trang có đối thủ, giá, ma trận khoảng trống và TAM SAM SOM. Mọi con số gắn nhãn nguồn, số không truy được nguồn thì từ chối in. Kích hoạt khi nói "nghiên cứu thị trường", "research thị trường", "đối thủ đang bán gì", "thị trường này còn trống chỗ nào", "trước khi build tôi cần biết gì".
---

# /nghien-cuu-thi-truong

Từ một câu hỏi ra một bản nghiên cứu dùng được để quyết định. Agent làm phần
nặng, bạn giữ 2 việc không giao được: đặt mục tiêu, và sàng lọc kết quả.

## Dùng khi nào

Trước khi build bất cứ thứ gì định đem bán. Build cho riêng mình dùng thì
không cần. Build để bán mà bỏ bước này thì sẽ phải trả giá ở chỗ khác.

## Bước 0, viết mục tiêu một câu

Bản nghiên cứu trả lời một quyết định, không phải "mọi thứ về X". Viết trước:

```
Tôi cần biết <điều gì> về thị trường <X> để quyết định <build hay không / giá bao nhiêu / vào bằng đường nào>.
```

Không có câu này thì agent trả về một bản tóm tắt chung chung không dùng vào
việc gì.

## Bước 1, thả nhiều agent quét song song

Chia việc thành các mảng độc lập: đối thủ và giá; người dùng đang khen gì chê
gì; kích thước thị trường; và một agent riêng chuyên đi **phá** luận điểm khác
biệt của bạn.

Dán nguyên đoạn này vào prompt của TỪNG agent:

> Gắn nhãn mọi dữ kiện: **[ĐÃ MỞ TRANG GỐC, kèm URL và ngày đọc]** nếu bạn tự
> mở đúng trang của chính hãng, hoặc **[CHƯA XÁC MINH, kèm lý do]**.
> Ưu tiên trang gốc hơn bài tổng hợp. Con số nào lan truyền khắp nơi mà không
> truy được nguồn gốc thì nói thẳng: số không truy được nguồn là một PHÁT HIỆN,
> không phải một trích dẫn. Mọi phép quy đổi phải ghi rõ giả định.
> TUYỆT ĐỐI không bịa số. Không tìm thấy thì ghi không tìm thấy.
> Trả về dữ liệu thô, không tự tóm tắt gọn, không tự dựng trang, không publish gì.

## 3 luật ít tài liệu nào viết ra

3 luật này rút từ việc thật, không lấy từ sách. Ví dụ trong đó lấy ở thị trường
Việt Nam, còn luật thì thị trường nào cũng đúng.

### Luật 1, mở trang gốc, đừng đọc bài tổng hợp

Bài so sánh trên mạng hay chép giá cũ từ vài năm trước. Tin vào đó là tính sai
cả thị trường.

Và cẩn thận với mã trạng thái: rất nhiều site trả về 200 cho **mọi** đường
dẫn, kể cả đường dẫn bịa. Muốn biết một trang có thật hay không thì đọc nội
dung và so độ dài, đừng tin mã 200.

### Luật 2, giá niêm yết không phải giá khách trả

Nhóm bán qua tư vấn thường niêm yết một con số thấp làm mồi, giá thật chốt
trong phòng kín và có thể cao hơn nhiều lần.

Cách kiểm duy nhất: **hỏi thẳng người đang là khách của họ.** Đọc trang bán
hàng chỉ cho biết họ muốn nói gì, không cho biết khách trả bao nhiêu.

Trong bản nghiên cứu phải tách rõ 2 cột: giá niêm yết, và giá thực thu nếu
truy được.

### Luật 3, đối thủ đáng sợ nhất có khi không phải phần mềm nào cả

Ở khúc giá thấp, thứ khách đang dùng thường là công cụ miễn phí ghép lại bằng
tay. Ví dụ trong ngành bán khoá học: Google Drive chứa video, nhắn tin giao tài
khoản, chuyển khoản tay. Giá 0 đồng, không trần, dữ liệu nằm trong tay họ.

Ma trận khoảng trống mà bỏ sót nhóm này là ma trận sai. Luôn thêm một dòng
"cách làm tay" vào bảng đối thủ.

## Bước 2, tìm chỗ đau bằng đánh giá 1 sao và 2 sao

Vào các trang đánh giá sản phẩm rồi **lọc riêng đánh giá 1 và 2 sao**. Khách
đã trả tiền rồi mà vẫn chê nghĩa là nhu cầu có thật và đối thủ đang làm chưa
tốt. Đó có thể chính là chỗ để đi vào.

Xếp nỗi đau theo **số nền tảng độc lập cùng bị chê một chuyện**. Một người chê
là ý kiến, 6 nền tảng cùng bị chê một chuyện là quy luật.

Nhiều thị trường không có lớp đánh giá công khai, Việt Nam là một ví dụ. Nếu
tìm không ra thì đó cũng là một phát hiện, ghi vào bản nghiên cứu. Khi đó phỏng vấn trực tiếp
người đang trả tiền không phải lựa chọn bổ sung, nó là nguồn duy nhất.

## Bước 3, tổng hợp

- **3 nhãn trên mọi con số:** đã mở trang gốc, sơ cấp, chưa xác minh. Hãng tự
  nói về mình thì là quảng cáo, dù nghe hay tới đâu
- **TAM SAM SOM bắt buộc**, tính bằng chuỗi phép nhân với giả định in ra:
  ```
  TAM = <số đơn vị có nhu cầu> × <doanh thu một khách một năm>
  SAM = TAM × <% đúng phân khúc> × <% tiếp cận được bằng kênh của bạn>
  SOM = SAM × <% thực tế giành được trong 12 tháng với nguồn lực hiện có>
  ```
  Người đọc được phép cãi giả định, không cãi được số học
- **Mục "số bị từ chối in":** liệt kê những con số lan truyền mà không truy
  được nguồn, và vì sao. Mục này tạo niềm tin hơn mọi trích dẫn
- **Mục "chỗ chưa xác minh được":** ghi thẳng, kèm cách kiểm và mất bao lâu

## Bước 4, kiểm điểm khác biệt trước khi tin

Viết ra các điểm khác biệt, rồi đi kiểm từng cái xem **đã có ai làm chưa**.
Thả một agent riêng, nhiệm vụ duy nhất là tìm người đã làm rồi. Càng tìm thấy
nhiều càng tốt, vì tìm ra bây giờ rẻ hơn tìm ra sau khi đã build.

Cái nào còn sống sót thì hỏi tiếp 1 câu:

> **Nếu đối thủ copy điều này, họ mất gì?**

Không mất gì thì đó không phải điểm khác biệt, chỉ là một tính năng, và họ
copy trong một tuần.

Mất một dòng doanh thu đang chạy thì đó mới là khác biệt bền. Ví dụ: nền tảng
tính tiền theo đầu người dùng thì về kỹ thuật bỏ cách tính đó trong một đêm là
xong, nhưng làm vậy là tự phá bảng giá và tự cắt đường lên gói của toàn bộ
khách hiện có. Nên họ không làm.

## Trước khi nộp, tự kiểm

- [ ] Mọi con số có nhãn, có nguồn kèm ngày đọc
- [ ] Có TAM SAM SOM với giả định in ra
- [ ] Có cột giá của từng đối thủ, tách giá niêm yết và giá thực thu
- [ ] Bảng đối thủ có dòng "cách làm tay"
- [ ] Có mục số bị từ chối in
- [ ] Mỗi điểm khác biệt đã qua câu hỏi "đối thủ copy thì họ mất gì"
- [ ] Bạn đã đọc hết và sửa ít nhất một chỗ agent nói sai. Chưa tìm thấy chỗ
      sai nào thì gần như chắc chắn là chưa đọc kỹ

## Xác thực trước khi build, 3 cách rẻ nhất

Bản nghiên cứu nói thị trường có khoảng trống. Trước khi tốn một dòng mã, xác
thực bằng ít nhất 1 trong 3 cách, xếp theo độ rẻ:

1. **Trang mô tả kèm ô để lại email.** Chưa build gì cả. Đo xem ai thực sự để
   lại thông tin
2. **Nói chuyện với 5 khách thật** đúng nhóm bạn nhắm: họ đang giải bằng gì,
   trả bao nhiêu, nỗi đau có đúng như mình đoán không
3. **Bán trước** cho người đã biết mình. Có người xuống tiền trước khi sản
   phẩm tồn tại là tín hiệu mạnh nhất

## Skill này phải tự tốt lên

1. **Tự chấm sau mỗi lần chạy** theo danh sách tự kiểm ở trên. Thiếu chỗ nào,
   chỗ nào người dùng phải sửa tay, thì đề xuất cập nhật thẳng vào tệp này
2. **Thi thoảng kiểm lại.** Giá và công cụ đổi liên tục. Con số hay tên công
   cụ nào trong tệp này đã vài tháng tuổi thì mở trang gốc kiểm lại trước khi tin
3. **Không biết thì hỏi người.** Cái gì ngoài tầm thì nói thẳng và chỉ người
   dùng đi hỏi người thật, đừng đoán cho đủ bài
