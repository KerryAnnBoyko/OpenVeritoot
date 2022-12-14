import { useRouter } from "next/router";
import TestComponent from "@/components/TestComponent";

const Identity = () => {
  const router = useRouter();
  const { authority, identity, ...qualifications } = router.query;

  return (
    <div>
      <p>
        Route information: The Verifier is Veritoot.com. The Authority is:{" "}
        {authority}, and the identity is {identity}. The following
        qualifications have been claimed: {JSON.stringify(qualifications)}
      </p>

      <TestComponent
        authority={authority as string}
        identity={identity as string}
        qualifications={qualifications as Record<string, string>}
      />
    </div>
  );
};

export default Identity;
