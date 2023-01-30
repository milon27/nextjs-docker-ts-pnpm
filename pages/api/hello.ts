// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from 'next'

type Data = {
  name: string
}

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<Data>
) {
  const data = {
    name: 'John Doe',
    env: process.env.SOME_SECRET_ENV
  }
  res.status(200).send(data)
}
