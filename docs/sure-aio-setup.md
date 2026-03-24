# Sure-AIO Unraid Setup Guide

This is an All-In-One (AIO) template for **Sure Finance** (community fork of Maybe Finance). It runs both the Rails web server and Sidekiq background worker in a single container.

## TIER 1: Quick Start (Easy Mode)
- **Time**: 5 minutes.
- **Dependencies**: None.
- **Storage**: Uses built-in SQLite for simplicity.
- **Action**: Fill in `App URL`, `Secret Key Base` (use `openssl rand -hex 64`), and `Default Currency`. Click **Apply**.

## TIER 2: Recommended Setup (Standard Mode)
- **Dependencies**: Requires `postgres-shared` and `redis-shared`.
- **Action**: Update `Postgres Host`, `Redis URL`, and database credentials in the Advanced section. This is recommended for production use and better performance.

## TIER 3: Advanced Configuration (Power Mode)
- **Customization**: Exposes all Rails environment variables, SMTP for email notifications (Resend.com recommended), and market data keys (TwelveData).
- **Automation**: GitHub Actions workflow builds and pushes this image weekly to track upstream community updates.
