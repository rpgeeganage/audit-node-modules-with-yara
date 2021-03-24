import { exec } from 'child_process';

import debug from 'debug';

const debugExecteSearch = debug('common');

/**
 * Execute the search operation
 *
 * @export
 * @param {string} folderToAudit
 * @param {string} yaraRulesFolder
 * @return {*}  {Promise<string[]>}
 */
export async function executeSearch(
  folderToAudit: string,
  yaraRulesFolder: string
): Promise<string[]> {
  const command = `yara --recursive --print-strings --fail-on-warnings \`find ${yaraRulesFolder} -type f -name "*.yara"\` ${folderToAudit}`;

  const results = await executeShellCommand(command);

  return results
    .split(/\n/)
    .map((s) => s?.trim())
    .filter((s) => s.length);
}

/**
 * Execute shell command
 *
 * @param {string} command
 * @return {*}  {Promise<string>}
 */
export function executeShellCommand(command: string): Promise<string> {
  return new Promise((resolve, reject) => {
    debugExecteSearch('executeShellCommand: [%s]', command);

    exec(command, (error: Error | null, stdOut: string, stdErr: string) => {
      if (error) {
        debugExecteSearch('executeShellCommand: Error occured %o', error);

        return reject(error);
      }

      if (stdErr) {
        debugExecteSearch('executeShellCommand: Std Error occured %s', error);

        return reject(new Error(stdErr));
      }

      debugExecteSearch('executeShellCommand: stdOut %s', stdOut);

      return resolve(stdOut);
    });
  });
}
