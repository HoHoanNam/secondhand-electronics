-- Chạy MỘT LẦN bằng user postgres (superuser):
--   psql -U postgres -f db/init/01-create-schemas.sql
-- Đổi 'change_me' thành mật khẩu thật trước khi chạy, và điền cùng mật khẩu đó vào .env.
-- Sau này khi chuyển sang Docker, file này được mount vào /docker-entrypoint-initdb.d/.

CREATE USER core_svc WITH PASSWORD '123456';
CREATE USER storefront_svc WITH PASSWORD '123456';

CREATE DATABASE secondhand ENCODING 'UTF8' TEMPLATE template0;

\connect secondhand

-- Chỉ hai service được kết nối; không ai dùng schema public
REVOKE CONNECT ON DATABASE secondhand FROM PUBLIC;
GRANT CONNECT ON DATABASE secondhand TO core_svc, storefront_svc;
REVOKE ALL ON SCHEMA public FROM PUBLIC;

-- Mỗi service sở hữu đúng một schema
CREATE SCHEMA core AUTHORIZATION core_svc;
CREATE SCHEMA storefront AUTHORIZATION storefront_svc;

ALTER ROLE core_svc IN DATABASE secondhand SET search_path = core;
ALTER ROLE storefront_svc IN DATABASE secondhand SET search_path = storefront;
