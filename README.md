# README

This application implements user authentication with email and 2fa

### Setup

1. Build Project
```bash
./build.sh
```
2. Run Project
```bash
./run.sh
```
### Database Setup
```bash
docker-compose run app rails db:create
docker-compose run app rails db:migrate
```
