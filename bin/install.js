#!/usr/bin/env node
// Council of Advisors — npx installer

const https = require("https");
const fs = require("fs");
const path = require("path");
const os = require("os");
const { execSync } = require("child_process");

const BASE_URL =
  "https://raw.githubusercontent.com/Enzo0673/council-of-advisors/main";

const FILES = {
  "skills/council-of-advisors/SKILL.md": `${BASE_URL}/skills/council-of-advisors/SKILL.md`,
  ".claude-plugin/plugin.json": `${BASE_URL}/.claude-plugin/plugin.json`,
  "GEMINI.md": `${BASE_URL}/GEMINI.md`,
  "AGENTS.md": `${BASE_URL}/AGENTS.md`,
};

const TARGETS = {
  claude: {
    detect: () => commandExists("claude"),
    dest: path.join(os.homedir(), ".claude", "plugins", "marketplaces", "council-of-advisors"),
    files: ["skills/council-of-advisors/SKILL.md", ".claude-plugin/plugin.json"],
    label: "Claude Code",
  },
  gemini: {
    detect: () => commandExists("gemini"),
    dest: path.join(os.homedir(), ".gemini", "plugins", "council-of-advisors"),
    files: ["skills/council-of-advisors/SKILL.md", "GEMINI.md"],
    label: "Gemini CLI",
  },
  copilot: {
    detect: () => commandExists("gh-copilot"),
    dest: path.join(os.homedir(), ".copilot", "plugins", "council-of-advisors"),
    files: ["skills/council-of-advisors/SKILL.md"],
    label: "Copilot CLI",
  },
  codex: {
    detect: () => commandExists("codex"),
    dest: path.join(os.homedir(), ".codex", "plugins", "council-of-advisors"),
    files: ["skills/council-of-advisors/SKILL.md", "AGENTS.md"],
    label: "Codex",
  },
};

function commandExists(cmd) {
  try {
    execSync(`${process.platform === "win32" ? "where" : "which"} ${cmd}`, {
      stdio: "ignore",
    });
    return true;
  } catch {
    return false;
  }
}

function download(url, dest) {
  return new Promise((resolve, reject) => {
    fs.mkdirSync(path.dirname(dest), { recursive: true });
    const file = fs.createWriteStream(dest);
    https.get(url, (res) => {
      if (res.statusCode === 301 || res.statusCode === 302) {
        file.close();
        download(res.headers.location, dest).then(resolve).catch(reject);
        return;
      }
      res.pipe(file);
      file.on("finish", () => file.close(resolve));
    }).on("error", reject);
  });
}

async function main() {
  console.log("\n  Council of Advisors — Installer\n  ================================\n");

  const detected = Object.entries(TARGETS).filter(([, t]) => t.detect());

  if (detected.length === 0) {
    console.log("  No supported AI CLI tool detected.");
    console.log("  Supported: Claude Code, Gemini CLI, Copilot CLI, Codex\n");
    console.log("  Manual install:");
    console.log("    git clone https://github.com/Enzo0673/council-of-advisors \\");
    console.log("      ~/.claude/plugins/marketplaces/council-of-advisors\n");
    process.exit(1);
  }

  for (const [, target] of detected) {
    console.log(`  Installing for ${target.label}...`);
    for (const file of target.files) {
      const dest = path.join(target.dest, file);
      await download(FILES[file], dest);
    }
    console.log(`  \x1b[32mInstalled to ${target.dest}\x1b[0m`);
    console.log(`  Restart ${target.label} to activate.\n`);
  }

  console.log("  \x1b[32mDone!\x1b[0m Invoke with: /council-of-advisors\n");
}

main().catch((err) => {
  console.error("  Error:", err.message);
  process.exit(1);
});
