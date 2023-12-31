import { expect } from 'earl'

import { Hex } from './Hex'

describe(Hex.name, () => {
  it('transforms number zero', async () => {
    const value = Hex(0)
    expect(value.toString()).toEqual('0x0')
  })

  it('transforms random two byte number', async () => {
    const value = Hex(34234)
    expect(value.toString()).toEqual('0x85ba')
  })

  it('transforms bigint zero', async () => {
    const value = Hex(0n)
    expect(value.toString()).toEqual('0x0')
  })

  it('transforms random eight byte bigint', async () => {
    const value = Hex(9022819797136957440n)
    expect(value.toString()).toEqual('0x7d377eccf0b5e000')
  })

  it('transforms a just the prefix to zero', async () => {
    const value = Hex('0x')
    expect(value.toString()).toEqual('0x0')
  })

  it('transforms a valid hex string', async () => {
    const value = Hex('0xdeadcafe')
    expect(value.toString()).toEqual('0xdeadcafe')
  })

  it('transforms a valid long hex string', async () => {
    const value = Hex('0xdeadcafebabebeefabacadaba0987654321234567890')
    expect(value.toString()).toEqual(
      '0xdeadcafebabebeefabacadaba0987654321234567890',
    )
  })

  it('transforms does not remove padding zeroes', async () => {
    const value = Hex('0x0001')
    expect(value.toString()).toEqual('0x0001')
  })

  it('throws on invalid string', async () => {
    expect(() => Hex('quick red fox jumped over the lazy dog')).toThrow()
  })

  it('throws on almost-valid string', async () => {
    expect(() =>
      Hex('0xdeadcafebabebeefabacadaba0987foo321234567890'),
    ).toThrow()
  })

  describe(Hex.concat.name, () => {
    it('should concat two valid Hex objects', async () => {
      expect(Hex.concat(Hex('0xabaaba'), Hex('0xebeebe'))).toEqual(
        Hex('0xabaabaebeebe'),
      )
      expect(Hex.concat(Hex('0xebeebe'), Hex('0xabaaba'))).toEqual(
        Hex('0xebeebeabaaba'),
      )
    })

    it('should concat one valid and one empty Hex object', async () => {
      expect(Hex.concat(Hex('0xabaaba'), Hex(''))).toEqual(Hex('0xabaaba0'))
      expect(Hex.concat(Hex(''), Hex('0xebeebe'))).toEqual(Hex('0x0ebeebe'))
    })

    it('should concat two empty Hex objects', async () => {
      expect(Hex.concat(Hex(''), Hex(''))).toEqual(Hex('0x00'))
      expect(Hex.concat(Hex(''), Hex(''))).toEqual(Hex('0x00'))
    })
  })
})
