# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This workspace contains three separate projects:

| Project | Path | Stack |
|---|---|---|
| Flutter app (tutorial) | `tuto/tuto/` | Flutter / Dart |
| Invoice backend | `invoice/be/` | NestJS, Knex, PostgreSQL |
| Invoice frontend | `invoice/fe/` | React Router v7, TailwindCSS v4, Zod |

---

## Flutter App (`tuto/tuto/`)

### Commands
```bash
flutter run          # Run on connected device/emulator
flutter test         # Run tests
flutter analyze      # Lint/analyze
flutter build apk    # Build Android APK
```

Entry point: `lib/main.dart`. Currently a minimal scaffold — only `MainApp` widget exists.

---

## Invoice Backend (`invoice/be/`)

### Commands
```bash
npm run start:dev         # Dev server with hot-reload
npm run build             # Compile TypeScript
npm run test              # Unit tests (jest)
npm run test:e2e          # E2E tests
npm run lint              # ESLint with auto-fix
npm run migrate:latest    # Run pending DB migrations
npm run migrate:rollback  # Roll back last migration
npm run migrate:status    # Check migration status
```

Run a single test file:
```bash
npx jest src/users/users.service.spec.ts
```

### Architecture

NestJS monolith with feature modules. Each module lives in `src/<module>/` with a controller, service, and module file. Modules:
- **auth** — JWT auth (`passport-jwt`), 7-day tokens. Secret from `JWT_SECRET` env var.
- **users** — CRUD with bcrypt password hashing
- **projects** — Projects with milestones, costs, and member assignments
- **invoices** — Invoice generation from project milestones; tracks items per milestone
- **receipts** — Payment receipts linked to invoices
- **attachments** — File uploads (multer) served statically from `uploads/` directory
- **audit** — Audit log trail with before/after value snapshots
- **settings** — Single-row company settings table
- **database** — Knex/PostgreSQL provider (`KNEX_TOKEN` injection token)

Database migrations live in `database/migrations/`. The `DatabaseModule` provides Knex via `KNEX_TOKEN` — inject it with `@Inject(KNEX_TOKEN)`.

### Environment
Requires `DATABASE_URL` and `JWT_SECRET` env vars (via `.env`).

---

## Invoice Frontend (`invoice/fe/`)

### Commands
```bash
npm run dev           # Vite dev server
npm run build         # Production build
npm run typecheck     # Type generation + tsc check
```

### Architecture

React Router v7 (framework mode) with file-based routing configured in `app/routes.ts`. All authenticated routes are wrapped by the `AppLayout` layout component.

**Key patterns:**

- **API layer** — `app/lib/api.ts` contains all typed API functions. All calls go through `apiFetch` which centralises 401 handling. API base URL from `VITE_API_URL` env var (defaults to `http://localhost:3000`).
- **Auth** — `app/lib/auth.tsx` manages JWT token; `setUnauthorizedHandler` in `api.ts` wires global 401 redirect.
- **State** — `app/store/index.tsx` is a React Context store initialised with mock data from `app/data/mock.ts`. This is the legacy in-memory store; real data flows through per-route hooks that call the API functions.
- **RBAC** — `app/lib/rbac.ts` defines `ALL_PERMISSIONS`, `useRBAC()` hook, and `canRole()`. Permissions are granular strings like `projects:view`, `invoices:mark_paid`. Nav items are filtered by permission.
- **Route structure** — each route folder contains `index.tsx` (page), `hooks.ts` (data-fetching/mutation hooks), `schemas.ts` (Zod validation), and modal/section components. PDF generation for invoices and receipts uses `@react-pdf/renderer` in `InvoicePDF.tsx` / `ReceiptPDF.tsx`.
- **Forms** — react-hook-form + Zod via `@hookform/resolvers/zod`.
