# Release Pipeline Simulator 🚀

![CI/CD Workflow](https://github.com/Gomesm09/release-pipeline-sim/actions/workflows/release.yml/badge.svg)

This project simulates a real-world CI/CD release engineering pipeline, showcasing environment promotion, artifact creation, version tagging, and deployment simulation — all powered by GitHub Actions.

---

## 🔧 Features

- ✅ Environment promotion: `dev` → `stage` → `prod`
- ✅ Build artifact generation (`.tar.gz`)
- ✅ Git version tagging (e.g. `v1.2.3`)
- ✅ CI/CD automation via GitHub Actions
- ✅ Production artifacts auto-uploaded to [GitHub Releases](https://github.com/Gomesm09/release-pipeline-sim/releases)
- ✅ Manual script support for local simulation

---

## 🧪 How to Reproduce Locally

You can simulate the full release flow manually:

```bash
# Promote dev to stage
./scripts/promote.sh dev stage

# Promote stage to prod
./scripts/promote.sh stage prod

# Build for each environment
./scripts/build.sh dev
./scripts/build.sh stage
./scripts/build.sh prod

---

🧠 **Built by:** Michael Gomes  
🛠️ **Role:** Devops Release Engineer  
📅 **Created:** June 2025
