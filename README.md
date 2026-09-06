# VUTEX SKILLS

Bộ luật làm việc cho agent, viết cho người build sản phẩm bán ở thị trường Việt Nam.

Mỗi skill là một tệp luật. Agent tự đọc khi gặp đúng việc, không cần gọi tên.

## Có gì trong này

| Skill | Dùng khi |
|---|---|
| `vtx-nghien-cuu-thi-truong` | Trước khi build bất cứ thứ gì định đem bán |
| `vtx-kiem-thu` | Đo xem công cụ chạy đúng chưa, sao cho con số là thật |
| `vtx-giu-key` | Chạm tới khoá API, dữ liệu người thật, hoặc luồng thu tiền |

Ba skill này không phải lý thuyết. Mỗi luật trong đó rút từ một lỗi đã mắc thật
trong lúc build, và mỗi luật đều ghi rõ lỗi đó là gì.

## Cài

Tải hoặc clone thư mục này về máy, rồi chạy script cài ở trong đó.

**Windows**

```powershell
.\setup.ps1
```

**macOS, Linux**

```bash
chmod +x setup && ./setup
```

Script tạo liên kết từ mỗi thư mục skill sang `~/.claude/skills/`. Chạy lại bao
nhiêu lần cũng an toàn, và nó không ghi đè skill nào bạn đã tự viết trùng tên.

Cài xong, mở một phiên agent mới rồi hỏi thử:

> Tôi sắp nghiên cứu một thị trường, có luật nào phải theo không?

Agent nhắc lại được 3 luật riêng cho thị trường Việt Nam là đã nhận skill.

## Sửa cho hợp việc của bạn

Ba tệp `SKILL.md` là văn bản thường, mở ra sửa được. Ví dụ của tôi lấy từ ngành
bán khoá học online. Bạn ở ngành khác thì thay ví dụ, giữ nguyên phần luật.

Phần đáng giữ nhất là các mục **"Trước khi nộp, tự kiểm"**. Đó là chỗ chặn agent
trả về một bản đẹp mà rỗng.

## Viết thêm skill mới

Thêm một thư mục, bên trong có một tệp `SKILL.md`, mở đầu bằng khối này:

```markdown
---
name: ten-skill-viet-lien-bang-gach-ngang
description: Skill này làm gì, và câu nói nào của người dùng thì kích hoạt nó.
---
```

Dòng `description` quyết định agent có nhận ra để đọc hay không, nên viết rõ cả
việc lẫn từ khoá kích hoạt. Chạy lại script cài là xong.

## Giấy phép

MIT. Dùng, sửa, chia lại, bán kèm sản phẩm đều được. Chỉ cần giữ tệp `LICENSE`
đi kèm.

Nếu bộ này giúp được việc thì viết lại bằng chữ của bạn rồi chia cho người khác.
Đó là cách nó tốt lên.

---

CÔNG TY TNHH VUTEX, Đà Nẵng
