export const parseQualifications = (
  qualifications?: Record<string, string>
): Record<string, string[]> => {
  if (!qualifications) {
    return {};
  }
  try {
    const output: Record<string, string[]> = {};
    for (let auth in qualifications) {
      output[auth] = qualifications[auth].split(",");
    }
    return output;
  } catch (e) {
    console.error(e);
    throw new Error(e);
  }
};

export default parseQualifications;
