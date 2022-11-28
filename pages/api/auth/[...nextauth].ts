import NextAuth from "next-auth";
import GithubProvider, { GithubProfile } from "next-auth/providers/github";


export const authOptions = {
  providers: [
    // GithubProvider({
    //   ...githubCredentials,
    // }),
  ],
};

export default NextAuth(authOptions);
