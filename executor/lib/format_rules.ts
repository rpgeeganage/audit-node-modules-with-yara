/**
 * Single YARA rule which applied
 *
 * @export
 * @interface ISingleYARARule
 */
export interface ISingleYARARule {
  rule: string;
  string_information: string[];
  [key: string]: string | string[];
}

/**
 * Extract Yara Rules Mapping
 *
 * @param {string} yaraOutput
 * @param {ISavedFile} executableFilePath
 * @return {*}  {ISingleYARARule[]}
 */
export function formatYaraResults(
  outputLines: string[],
  executableFilePath: string
): ISingleYARARule[] {
  const pathRegEx = new RegExp(executableFilePath);
  const ruleIndexes = outputLines.reduce(
    (acc: number[], outline: string, index: number) => {
      if (pathRegEx.test(outline)) {
        acc.push(index);
      }

      return acc;
    },
    []
  );

  return buildRules(ruleIndexes, outputLines);
}

/**
 * Build YARA rule
 *
 * @param {number[]} ruleIndexes
 * @param {string[]} output
 * @return {*}
 */
function buildRules(ruleIndexes: number[], output: string[]) {
  return ruleIndexes.map((v, i: number) => {
    return {
      rule: output[v].split(/\s/, 2)[0],
      string_information: Number.isNaN(ruleIndexes[i + 1] - 1)
        ? output.slice(v + 1)
        : output.slice(v + 1, ruleIndexes[i + 1])
    };
  });
}
