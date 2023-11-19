/* eslint-disable */
import { Server } from './server'
import { AppSequencerApi } from './app';

export type ApiOptions = {
  cors: string;
  address: string;
  port: number;
  enableRequestLogging: boolean;
};

export const defaultApiOptions: ApiOptions = {
  cors: "*",
  address: "0.0.0.0",
  port: 80,
  enableRequestLogging: true,
};

(async () => {
    //! need a local database in here to catch the incoming state transitions 
  
    const server = await Server.init({
      enableRequestLogging: true,
      port: 80,
      host: "0.0.0.0",
      cors: "*"
    });
  
    const appSequencer =  new AppSequencerApi({
      server: server.application,
    });
    
    appSequencer.init();
  
    await server.listen();
})()