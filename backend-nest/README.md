# backend-nest

BFF (NestJS 12, ESM) — kết nối PostgreSQL schema `storefront` bằng user `storefront_svc`.

```
cp .env.example .env     # điền DB_PASSWORD
npm install
npm run start:dev        # http://localhost:3000/api
npm test                 # unit test (vitest)
```

Mọi route có tiền tố `/api`. `ValidationPipe` bật sẵn (whitelist), CORS mở cho `CORS_ORIGIN`.
