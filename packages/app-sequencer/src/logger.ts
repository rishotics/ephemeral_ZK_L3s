/* eslint-disable */
import pino from 'pino'

const logger = pino({
  enabled: false, // for now disabling 
  level: "trace",
  transport: {
    target: "pino-pretty",
    options: {
      colorize: true,
    },
  },
  serializers: {
    res: () => null,
    req: (req) => ({
      method: req.method,
      url: req.url,
      path: req.path,
      body: req.body,
    }),
  },
});

export type Logger = typeof logger;

export default logger;
