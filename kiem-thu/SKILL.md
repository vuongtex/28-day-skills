---
name: kiem-thu
description: Kiểm thử một công cụ AI sao cho con số đo được là thật, không phải vòng lặp tự xác nhận. Chặn lỗi cùng một người vừa viết dữ liệu, vừa viết đáp án, vừa viết bộ chấm. Kích hoạt khi nói "kiểm thử", "test công cụ", "đo độ chính xác", "công cụ này chạy đúng chưa", "làm sao biết AI chấm đúng".
---

# /kiem-thu

Skill này tồn tại vì một lỗi thật, mắc trong một ngày build, và suýt nữa được
đem đi nộp như một thành tích.

## Câu chuyện gốc, đọc trước rồi hãy làm

Một công cụ dùng AI chấm điểm khách hàng tiềm năng. Nó thay cho phán đoán của
con người, nên thước đo phải là con người.

Cách làm lúc đó:

1. Tự viết 20 dòng dữ liệu mẫu
2. Tự viết luôn cột đáp án cho 20 dòng đó
3. Tự viết bộ chấm
4. Chạy, ra 40%, không đạt
5. Chỉnh bộ chấm, chạy lại, ra 90%, thấy đẹp quá

**Con số 90% đó không đo được điều gì.**

Cùng một người vừa viết dữ liệu, vừa viết đáp án, vừa viết bộ chấm, rồi chỉnh
bộ chấm cho khớp với đáp án của chính mình. Dữ liệu được viết ra đã mang sẵn
những dấu hiệu mà bộ chấm đi tìm, nên khớp cao là tất yếu.

Đó là **vòng lặp tự xác nhận**. Nó chỉ chứng minh người viết nhất quán với
chính mình, không chứng minh gì về sản phẩm.

## Luật số 1, 3 vai phải tách

> Người viết **dữ liệu kiểm thử**, người viết **đáp án**, và người viết **bộ
> chấm** không được là cùng một người.

Không tách được người thì tách bằng cách khác:

- **Đáp án lấy từ dữ liệu thật**, do người vận hành thật chấm tay, không phải
  do người viết mã nghĩ ra
- Hoặc **dữ liệu lấy từ thực tế**, người viết mã không được sửa gì trong đó

Vi phạm luật này thì con số ra bao nhiêu cũng không dùng được, và tệ hơn là nó
làm bạn tin nhầm.

## Luật số 2, dữ liệu kiểm thử phải là dữ liệu thật

Dữ liệu bịa dùng được cho đúng một việc: kiểm đường ống có chạy thông không.
Đọc tệp có lỗi không, gọi API có lỗi không, ghi kết quả có lỗi không.

Nó **không** đo được chất lượng phán đoán. Muốn đo chất lượng thì phải lấy dữ
liệu từ công việc thật.

Trong tài liệu, 2 loại này phải ghi thành 2 dòng riêng, đừng gộp:

| Chế độ | Đo cái gì | Dùng dữ liệu gì |
|---|---|---|
| Kiểm đường ống | Chạy có lỗi không | Dữ liệu mẫu, bịa cũng được |
| Đo chất lượng | Máy có khớp với người không | Dữ liệu thật, đáp án do người vận hành chấm |

## Cách đo, tuỳ loại công cụ

### Công cụ thay phán đoán của người

Ví dụ: chấm điểm, phân loại, xếp hạng, viết nháp.

1. Lấy **20 dòng dữ liệu thật** từ công việc đang chạy
2. Người vận hành thật chấm tay trước, ghi vào một cột riêng
3. **Xoá cột đáp án** rồi mới đưa cho máy
4. So kết quả, tính tỉ lệ khớp
5. Đọc từng dòng lệch, phân loại: lệch do máy hiểu sai, hay do tiêu chí viết
   chưa rõ

Ngưỡng đạt gợi ý: **từ 70% trở lên**. Dưới ngưỡng thì **sửa phần mô tả tiêu
chí, không sửa thuật toán.** Chất lượng nằm ở chỗ mô tả tiêu chí, không nằm ở
mã.

### Công cụ làm việc máy móc

Ví dụ: đổi định dạng, gom dữ liệu, sinh tệp.

Đo bằng số lần chạy đúng trên tổng số lần chạy, và **liệt kê những ca nó sai**.
Danh sách ca sai đáng giá hơn con số phần trăm.

## Luật số 3, ghi rõ con số đo trên dữ liệu gì

Mỗi con số kiểm thử trong tài liệu phải đi kèm 1 câu nói rõ:

- Đo trên dữ liệu gì, thật hay mẫu
- Ai chấm đáp án
- Đo ngày nào, model nào

Thiếu câu đó thì con số vô nghĩa với người đọc, và với chính bạn sau 3 tháng.

## Luật số 4, kết quả AI dao động giữa các lần chạy

Mô hình ngôn ngữ không cho ra kết quả giống hệt nhau mỗi lần, **kể cả khi đặt
temperature bằng 0**. Cùng một bộ dữ liệu chạy 2 lần có thể ra 2 con số
khác nhau.

Nên:

- Chạy ít nhất 2 lần, ghi cả 2 con số
- Đừng khoe con số cao nhất, ghi khoảng dao động
- Chênh lệch vài phần trăm giữa 2 lần chạy là bình thường, đừng chỉnh tiêu
  chí vì nó

## Khi chưa kịp đo trên dữ liệu thật

Ghi thẳng vào tài liệu là **chưa đo**. Đừng để con số của chế độ chạy thử đứng
đó như thể là thước đo sản phẩm.

Nộp bài mà ghi rõ chỗ chưa làm được thì mạnh hơn nhiều so với trưng một con số
đẹp nhưng rỗng. Người chấm hỏi một câu là lộ.

## Trước khi tin con số, tự kiểm

- [ ] Người viết dữ liệu, người viết đáp án, người viết bộ chấm không phải cùng
      một người
- [ ] Dữ liệu kiểm thử lấy từ công việc thật
- [ ] Đáp án được xoá khỏi dữ liệu trước khi đưa cho máy
- [ ] Con số đi kèm câu nói rõ đo trên dữ liệu gì, ai chấm, ngày nào, model nào
- [ ] Đã chạy ít nhất 2 lần và ghi khoảng dao động
- [ ] Đã đọc từng dòng lệch, không chỉ nhìn con số tổng
- [ ] Nếu không đạt ngưỡng, đã sửa mô tả tiêu chí chứ không sửa thuật toán

## Skill này phải tự tốt lên

Sau mỗi lần chạy, tự chấm theo danh sách trên. Chỗ nào người dùng phải sửa tay
thì đề xuất cập nhật thẳng vào tệp này. Không biết thì nói thẳng, đừng đoán cho
đủ bài.
