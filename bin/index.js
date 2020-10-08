const dotenv = require("dotenv");
const envsub = require("envsub");
const fetch = require("node-fetch");
const fs = require("fs");
const path = require("path");
dotenv.config();

const [_, __, templatePath, destinationPath] = process.argv;
(async () => {
  const repositories = JSON.parse(fs.readFileSync(path.join(__dirname, "../config/repositories.json")).toString());
  const headers = { "Authorization": `token ${process.env["GITHUB_TOKEN"]}`};
  const envs = await Promise.all(repositories.map(async _ => 
    {
      return {
        name: _.ENV_COMMIT_SHA,
        value: await fetch(`${_.GITHUB_REPO}${_.BRANCH}`, {headers})
        .then(res => res.json())
        .then(json => json.object.sha)
      }
      
    }));
    let templateFile = `${__dirname}/../${templatePath}`;
    let outputFile = `${__dirname}/../${destinationPath}`;
    let options = {
      envs,
      envFiles: [
        `${__dirname}/../.env`
      ],
      syntax: 'default'
    };
    
    await envsub({templateFile, outputFile, options});
})().catch(err => console.error(err));
