import React from "react";
import { useRouter } from "next/router";

const SocialLoginPage = () => {
  const router = useRouter();
  const { socialLogin } = router.query;

  return (
    <div>
      <p>
        Route information: This is the page for the social login: {socialLogin}.
      </p>

      <div>
        When this is ready, this will create a database query for that social
        login, which will query:
        <ul>
          <li>What identity is connected with this social login</li>
          <li>What authority has verified that identity? </li>
          <li>What verifications/qualifications has that authority given? </li>
          <li>What other accounts are associated with this identity?</li>
        </ul>
      </div>
    </div>
  );
};

export default SocialLoginPage;
