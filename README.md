# secondhand-electronics

Shop điện tử (hàng mới) + thu mua / sửa chữa / bán lại (secondhand).

| Thư mục           | Công nghệ                      | Cổng | Vai trò                                        |
| ----------------- | ------------------------------ | ---- | ---------------------------------------------- |
| `frontend/`       | Angular 22                     | 4200 | Storefront + trang quản trị                    |
| `backend-nest/`   | NestJS 12 + TypeORM            | 3000 | BFF: tài khoản, catalog đọc, giỏ hàng, media   |
| `backend-spring/` | Spring Boot 4.1 + JPA + Flyway | 8081 | Lõi: tồn kho, đơn hàng, thanh toán, secondhand |
| `db/init/`        | PostgreSQL 17                  | 5432 | Tạo database, user, schema                     |

Luồng gọi: Angular `/api/*` → (proxy) NestJS → Spring. Mỗi service chỉ ghi vào schema của mình (`storefront`, `core`).

## Yêu cầu

- Node.js ≥ 22.22.3 hoặc ≥ 24.15 (Angular CLI 22 đòi hỏi)
- JDK 21, Maven 3.9+
- PostgreSQL 17 cài trực tiếp trên máy

## Chạy lần đầu

1. **Database** — sửa mật khẩu trong `db/init/01-create-schemas.sql`, rồi:
   ```
   psql -U postgres -f db/init/01-create-schemas.sql
   ```
2. **Spring** — `cd backend-spring`, copy `.env.example` → `.env`, điền mật khẩu `core_svc`.
   Lần đầu tạo Maven wrapper: `mvn -N wrapper:wrapper`. Sau đó: `.\mvnw spring-boot:run`
   (hoặc mở `pom.xml` bằng IntelliJ và chạy `CoreApplication`).
   Kiểm tra: http://localhost:8081/actuator/health
3. **NestJS** — `cd backend-nest`, copy `.env.example` → `.env`, điền mật khẩu `storefront_svc`.
   `npm install` rồi `npm run start:dev`. Kiểm tra: http://localhost:3000/api
4. **Angular** — `cd frontend`, `npm install`, `npm start`. Mở http://localhost:4200

## Thư mục khác

- `docs/` — nghiệp vụ, kiến trúc, các quyết định thiết kế
- `exercises/` — bài tự viết để học
- `reviews/` — ghi chú tự giải thích, phản hồi review
