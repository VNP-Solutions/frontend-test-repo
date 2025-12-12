<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg" alt="Donate us"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow" alt="Follow us on Twitter"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

# Audit Vault Backend

NestJS backend API for the Audit Vault compliance document management system.

## Tech Stack

- **Framework**: NestJS
- **Language**: TypeScript
- **Database**: PostgreSQL (via Prisma ORM)
- **Authentication**: JWT (Passport)
- **Documentation**: Swagger/OpenAPI
- **Validation**: class-validator, class-transformer

## Prerequisites

- Docker and Docker Compose (Recommended)
- Node.js (v18 or higher) - *Optional if running via Docker*
- npm - *Optional if running via Docker*

## Quick Start (Docker)

The easiest way to run the application is using Docker. This will start the database, run migrations, seed the database with test data, and start the backend server in one go.

### 1. Start the Application

```bash
docker compose up --build
```
(Use `-d` to run in the background)

The startup process automatically:
1. Waits for the database to be ready
2. Runs database migrations
3. Seeds the database with sample data
4. Starts the API server

### 2. Access the API

- **API Base URL**: `http://localhost:3000`
- **Swagger Documentation**: `http://localhost:3000/api`

### 3. Default Credentials

The seed script creates the following test accounts:

- **Admin**: `admin@auditvault.com` / `password123`
- **Fund Manager**: `manager@funds.com` / `password123`
- **Auditor**: `auditor@auditvault.com` / `password123`
- **Compliance Officer**: `compliance@auditvault.com` / `password123`

## Manual Setup (Development)

If you prefer to run the application locally without Docker for the backend service:

### 1. Install Dependencies

```bash
npm install
```

### 2. Start Database Only

Start just the PostgreSQL database:

```bash
docker compose up -d db
```

### 3. Environment Variables

Create a `.env` file in the `backend` directory (defaults are usually sufficient for local dev):

```env
DATABASE_URL="postgresql://audit_admin:secure_password@localhost:5432/audit_vault?schema=public"
PORT=3000
JWT_SECRET="your-jwt-secret-key-change-in-production"
```

### 4. Database Migrations & Seeding

```bash
# Generate Prisma Client
npx prisma generate

# Run migrations
npx prisma migrate dev

# Seed database
npx prisma db seed
```

### 5. Start Server

```bash
# Development mode
npm run start:dev

# Watch mode
npm run start:debug
```

## Database Management

### Prisma Studio

To visually browse and edit your database:

```bash
npx prisma studio
```
Opens at `http://localhost:5555`.

## Project Structure

```
backend/
├── prisma/
│   ├── schema.prisma       # Database schema
│   ├── seed.ts             # Database seeding script
│   └── migrations/         # Database migrations
├── src/
│   ├── auth/               # Authentication module
│   ├── documents/          # Document management
│   ├── funds/              # Fund management
│   ├── users/              # User management
│   ├── audit/              # Audit trail
│   ├── chat/               # Chat functionality
│   ├── storage/            # File storage service
│   └── main.ts             # Application entry point
├── docker-compose.yml      # Docker configuration
└── start.sh               # Container startup script
```

## API Endpoints Overview

- **Authentication**: `/auth/login`, `/auth/register`
- **Documents**: `/documents`
- **Funds**: `/funds`
- **Users**: `/users`
- **Audit**: `/audit`
- **Chat**: `/chat`

Refer to Swagger docs (`/api`) for full details.

## Stopping the Application

To stop all services and remove volumes (cleans up database):

```bash
docker compose down -v
```
