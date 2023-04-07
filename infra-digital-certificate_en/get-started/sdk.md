# SDK

## Language

InfraBlockchain은 현재 JavaScript, TypeScript를 지원합니다. 모든 가이드는 현재 지원되고 있는 언어들에 대한 예제를 제공하고 있고, 계속해서 더 다양한 언어를 지원하기 위해 노력하고 있습니다.

이후의 가이드들에서 JavaScript와 TypeScript는 JS로 통합하여 표현하겠습니다.

## Installation

{% tabs %} {% tab title="JS" %}

```bash
yarn add infrablockchain-js
```

{% endtab %} {% endtabs %}

## Import

Please make sure that [Node.js](https://nodejs.org/) (version >= 12, except for v13) is installed on your operating system.

**Setup**[**#**](https://docs.nestjs.com/first-steps#setup)

Setting up a new project is quite simple with the [Nest CLI](https://docs.nestjs.com/cli/overview). With [npm](https://www.npmjs.com/) installed, you can create a new Nest project with the following commands in your OS terminal:

```bash
$ npm i -g @nestjs/cli
$ nest new project-name
```

> **HINT**To create a new project with TypeScript's [strict](https://www.typescriptlang.org/tsconfig#strict) mode enabled, pass the `--strict` flag to the `nest new` command.

The `project-name` directory will be created, node modules and a few other boilerplate files will be installed, and a `src/` directory will be created and populated with several core files.

srcapp.controller.spec.tsapp.controller.tsapp.module.tsapp.service.tsmain.ts

Here's a brief overview of those core files:

| `app.controller.ts` | A basic controller with a single route. |
| --- | --- |
| `app.controller.spec.ts` | The unit tests for the controller. |
| `app.module.ts` | The root module of the application. |
| `app.service.ts` | A basic service with a single method. |
| `main.ts` | The entry file of the application which uses the core function `NestFactory` to create a Nest application instance. |

The `main.ts` includes an async function, which will **bootstrap** our application:

main.tsJS

```typescript

import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
}
bootstrap();
```

To create a Nest application instance, we use the core `NestFactory` class. `NestFactory` exposes a few static methods that allow creating an application instance. The `create()` method returns an application object, which fulfills the `INestApplication` interface. This object provides a set of methods which are described in the coming chapters. In the `main.ts` example above, we simply start up our HTTP listener, which lets the application await inbound HTTP requests.

Note that a project scaffolded with the Nest CLI creates an initial project structure that encourages developers to follow the convention of keeping each module in its own dedicated directory.

> **HINT**By default, if any error happens while creating the application your app will exit with the code `1`. If you want to make it throw an error instead disable the option `abortOnError` (e.g., `NestFactory.create(AppModule, { abortOnError: false })`).

### Learn the right way!

* &#x20;80+ chapters
* &#x20;5+ hours of videos
* &#x20;Official certificate
* &#x20;Deep-dive sessions

[EXPLORE OFFICIAL COURSES](https://courses.nestjs.com/)

**Platform**[**#**](https://docs.nestjs.com/first-steps#platform)

Nest aims to be a platform-agnostic framework. Platform independence makes it possible to create reusable logical parts that developers can take advantage of across several different types of applications. Technically, Nest is able to work with any Node HTTP framework once an adapter is created. There are two HTTP platforms supported out-of-the-box: [express](https://expressjs.com/) and [fastify](https://www.fastify.io/). You can choose the one that best suits your needs.

| `platform-express` | [Express](https://expressjs.com/) is a well-known minimalist web framework for node. It's a battle tested, production-ready library with lots of resources implemented by the community. The `@nestjs/platform-express` package is used by default. Many users are well served with Express, and need take no action to enable it. |
| --- | --- |
| `platform-fastify` | [Fastify](https://www.fastify.io/) is a high performance and low overhead framework highly focused on providing maximum efficiency and speed. Read how to use it [here](https://docs.nestjs.com/techniques/performance). |

Whichever platform is used, it exposes its own application interface. These are seen respectively as `NestExpressApplication` and `NestFastifyApplication`.

When you pass a type to the `NestFactory.create()` method, as in the example below, the `app` object will have methods available exclusively for that specific platform. Note, however, you don't **need** to specify a type **unless** you actually want to access the underlying platform API.

```typescript

const app = await NestFactory.create<NestExpressApplication>(AppModule);
```

**Running the application**[**#**](https://docs.nestjs.com/first-steps#running-the-application)

Once the installation process is complete, you can run the following command at your OS command prompt to start the application listening for inbound HTTP requests:

```bash

$ npm run start
```

This command starts the app with the HTTP server listening on the port defined in the `src/main.ts` file. Once the application is running, open your browser and navigate to `http://localhost:3000/`. You should see the `Hello World!` message.

To watch for changes in your files, you can run the following command to start the application:

```bash

$ npm run start:dev
```

This command will watch your files, automatically recompiling and reloading the server.

\
