# backend-spring

Core service (Spring Boot 4.1, Java 21) — kết nối PostgreSQL schema `core` bằng user `core_svc`.

```
cp .env.example .env         # điền DB_PASSWORD
mvn -N wrapper:wrapper       # chỉ chạy một lần, tạo mvnw / mvnw.cmd
mvnw spring-boot:run         # http://localhost:8081/actuator/health
```

- Profile mặc định `local` đọc biến từ `.env` ở thư mục này.
- Schema chỉ được thay đổi bằng Flyway: thêm file vào `src/main/resources/db/migration` theo dạng `V1__mo_ta.sql`.
- Hibernate để `ddl-auto: validate`, không tự tạo bảng.
