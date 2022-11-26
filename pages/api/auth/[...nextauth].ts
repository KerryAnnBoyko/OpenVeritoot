import NextAuth from 'next-auth'
import GithubProvider from 'next-auth/providers/github';

import { githubCredentials } from '@/config/process';

export const authOptions = {
  providers: [
    GithubProvider(githubCredentials)
  ]
}