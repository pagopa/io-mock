const dotenv = require("dotenv");
const envsub = require("envsub");
const fetch = require("node-fetch");
dotenv.config();

const [_, __, repoUrlEnv, repoBranchEnv, templatePath, destinationPath] = process.argv;
(async () => {
  const commitSha = await fetch(`${process.env[repoUrlEnv]}${process.env[repoBranchEnv]}`)
    .then(res => res.json())
    .then(json => json.object.sha);
 
    let templateFile = `${__dirname}/../${templatePath}`;
    let outputFile = `${__dirname}/../${destinationPath}`;
    let options = {
      envs: [
        {name: "COMMIT_SHA", value: commitSha}
      ],
      envFiles: [
        `${__dirname}/../.env`
      ],
      syntax: 'default'
    };
    
    await envsub({templateFile, outputFile, options});
})().catch(err => console.error(err));
