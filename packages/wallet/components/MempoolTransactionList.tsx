'use client'

import { useState } from 'react'

import { trpc } from '@/lib/trpc'

import {
  GenericTransactionList,
  ListState,
  PAGINATION_SIZE,
} from './GenericTransactionList'

export function MempoolTransactionList() {
  const [state, setState] = useState<ListState>({
    pageNum: 0,
    isLoading: false,
    txs: [],
  })

  trpc.transactions.getMempoolRange.useQuery(
    // NOTE(radomski): Fetch plus one to know if there exists a next page
    {
      start: state.pageNum * PAGINATION_SIZE,
      end: (state.pageNum + 1) * PAGINATION_SIZE + 1,
    },
    {
      trpc: { ssr: false },
      onSuccess: (data) => {
        setState({ ...state, txs: data })
      },
    },
  )

  return (
    <GenericTransactionList
      title={'Mempool transactions'}
      state={state}
      setState={setState}
    />
  )
}
