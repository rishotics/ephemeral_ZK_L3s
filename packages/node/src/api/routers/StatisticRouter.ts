import { TransactionRepository } from '../../peripherals/database/TransactionRepository'
import { publicProcedure, router } from '../trpc'

// NOTE(radomski): We need to propagte the return type
// from this function, we can not infer it
// eslint-disable-next-line
export function createStatisticsRouter(txRepository: TransactionRepository) {
  return router({
    getOverview: publicProcedure.query(async () => {
      const date = await txRepository.getYoungestTransactionDate()
      const timestamp = date ? date.getTime() : null

      return {
        l2TransactionCount: await txRepository.getCount(),
        l2DailyTransactionCount: await txRepository.getCountSinceLast24h(),
        l2DailyTokenVolume: await txRepository.getDailyTokenVolume(),
        l1LastBatchUploadTimestamp: timestamp,
      }
    }),
  })
}
