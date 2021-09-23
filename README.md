# Aws + Serverless + NodeJs development environment

## Stack

- [Ubuntu](https://hub.docker.com/_/ubuntu)
- [NodeJs](https://nodejs.org/en/) + [Npm](https://www.npmjs.com/) (using [nvm](https://github.com/nvm-sh/nvm))
- [Serverless framework](https://www.serverless.com/)
- [AWS Cli](https://aws.amazon.com/cli/)

## Usage

1. Clone this project
2. Create environment variables files with `make setup` and then edit `.env`
3. Run container: `make start`
4. Check credentials: `aws s3 ls`
5. Start you serverless app: `serverless`
