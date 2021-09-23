# Aws + Serverless + NodeJs development environment

## Stack

- [Ubuntu](https://hub.docker.com/_/ubuntu)
- [NodeJs](https://nodejs.org/en/) + [Npm](https://www.npmjs.com/) (using [nvm](https://github.com/nvm-sh/nvm))
- [Serverless framework](https://www.serverless.com/)
- [AWS Cli](https://aws.amazon.com/cli/)

## Usage

1. Create environment variables files with `make setup` and then edit `.env`
2. Run container: `make start`
3. Check credentials: `aws s3 ls`
