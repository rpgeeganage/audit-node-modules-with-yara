import * as fs from 'fs';
import * as path from 'path';

import debug from 'debug';

import * as lib from './lib';

const debugIndex = debug('index');

const folderToAudit = process.env['FOLDER_TO_AUDIT'] as string;
const yaraRuleFolder = process.env['YARA_RULE_FOLDER'] as string;
const artifactFolder = process.env['ARTIFACT_FOLDER'] as string;

debugIndex('Folder to audit: %s', folderToAudit);
debugIndex('YARA rule folder: %s', yaraRuleFolder);
debugIndex('Artifact to audit: %s', artifactFolder);

/**
 * Execute the Audit Operation
 *
 * @return {*}  {Promise<void>}
 */
(async function execute() {
  const outputFile = path.join(artifactFolder, 'output.json');

  try {
    // Get Search results
    const searchResults = await lib.executeSearch(
      folderToAudit,
      yaraRuleFolder
    );

    debugIndex('search results: %o', searchResults);

    // Formatted results
    const formattedYaraResults = lib.formatYaraResults(
      searchResults,
      folderToAudit
    );

    debugIndex('formatted results: %o', formattedYaraResults);

    // Saving to artifact folder
    fs.writeFileSync(
      outputFile,
      JSON.stringify(formattedYaraResults, null, ' ')
    );
    console.info(
      '[OPERATION]: Output saved to: [%s]',
      outputFile.replace(`${process.env['WORK_DIR']}/`, '')
    );
  } catch (error) {
    // Logging error
    console.error(error);
  }
})();
