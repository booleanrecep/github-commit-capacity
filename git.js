const { exec } = require("child_process");
const commitCount = 1000000;
const pushThreshold = 10000;

const gitPull = () => {
  return exec("git pull", (err, stdout, stderr) => {
    if (err) {
      console.log("🔥 pull error: ", err);
      return;
    }
    console.log(`🚀 : ${stdout}`);
  });
};

const gitCommit = () => {
  return exec(
    'git commit --allow-empty -m "go + git + github = 💥"',
    (err, stdout, stderr) => {
      if (err) {
        console.log("🔥 commit error: ", err);
        return;
      }
      console.log(`🚀 : ${stdout}`);
    }
  );
};

const gitPush = () => {
  return exec("git push", (err, stdout, stderr) => {
    if (err) {
      console.log("🔥 push error: ", err);
      return;
    }

    console.log(`🛬 pushed successfully: ${stdout}`);
  });
};

const run = () => {
  gitPull();

  for (let i = 0; i < commitCount; i++) {
    gitCommit();
    console.log("i", i);

    if (i % pushThreshold === 0) {
      gitPush();
    }
  }
};

run();
