import React from "react";
import { useRouter } from "next/router";

/* This is designed to be used as a direct link on Mastodon pages for green-checks */

const InformationPage = () => {
  const router = useRouter();
  const { authority, identity, socialLogin, ...qualifications } = router.query;

  return (
    <div>
      <p>Route information:</p>
      <p>The verification service is Veritoot.com</p>
      <p>The authority is {authority}</p>
      <p>The identity is {identity}</p>
      <p>
        The social login is <a href={`/s/${socialLogin}/`}>{socialLogin}</a>
      </p>
      <p>
        These are the qualifications claimed: {JSON.stringify(qualifications)}
      </p>

      <p>
        Based on a query to this database, this will either answer with a "THIS
        INFORMATION IS TRUE" or "THIS INFORMATION IS FALSE"
      </p>
    </div>
  );
};

export default InformationPage;
