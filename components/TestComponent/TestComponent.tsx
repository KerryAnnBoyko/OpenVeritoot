import { parseQualifications } from "@/utils/parseQualifications";

export const TestComponent = ({
  authority,
  identity,
  qualifications,
}: {
  authority: string;
  identity: string;
  qualifications?: Record<string, string>;
}) => (
  <div>
    Hello. This is a test component! My props are authority: {authority},
    identity: {identity}
    <div>These are the qualifications claimed on this URL. We have to hit the database to confirm or deny them</div>
    <div>
      <table>
        <thead>
          <tr>
            <td>Authority</td>
            <td>Qualification</td>
          </tr>
        </thead>
        {qualifications ? (
          <tbody>
            {Object.entries(parseQualifications(qualifications)).map(
              ([auth, quals]: [string, string[]]) => (
                <tr>
                  <td>{auth}</td>
                  <td>
                    <ul>
                      {quals.map((qual) => (
                        <li>{qual}</li>
                      ))}
                    </ul>
                  </td>
                </tr>
              )
            )}
          </tbody>
        ) : null}
      </table>
    </div>
  </div>
);

export default TestComponent;
