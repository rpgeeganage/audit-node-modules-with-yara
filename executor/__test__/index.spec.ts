import * as path from 'path';

import * as lib from '../lib';

it('Should run the audit operation', async () => {
  const folderToAudit = path.join(__dirname, 'fixtures/node_module_folder');
  const yaraRuleFolder = path.join(__dirname, 'fixtures/yara_rules');

  const searchResults = await lib.executeSearch(folderToAudit, yaraRuleFolder);
  const formatedResults = lib.formatYaraResults(searchResults, folderToAudit);

  expect(JSON.stringify(formatedResults, null, ' ')).toMatchSnapshot();
});
