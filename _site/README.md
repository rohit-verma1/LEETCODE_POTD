# LeetCode Problem of the Day (POTD) Repository

This repository contains daily solutions to LeetCode problems. I am doing this to force discipline in solving a problem everyday.

## Architecture and File Structure

This is a Jekyll-based static site deployed on GitHub Pages. The landing page utilizes a custom HTML/CSS structure to maintain an independent aesthetic, while individual problem pages are rendered using the Minimal Mistakes Jekyll theme.

### High-Level Architecture

*   **Landing Page (`/`)**: Navigates to `index.html`, which injects content into `_layouts/landing.html`. It relies on pure custom HTML/CSS without theme dependencies.
*   **Problem Pages (`/potd/...`)**: Navigates to `_posts/*.md`, which uses `_layouts/single` from the Minimal Mistakes theme.

These components are intentionally separated to allow full customization of the landing page without conflicts from the base theme.

### Key Directories and Files

#### Root Configuration
*   `index.html`: The primary landing page interface containing the archive browser and problem cards. Uses Liquid templating to aggregate data from `_posts/`.
*   `_config.yml`: The main Jekyll configuration file. Controls site metadata, URL routing, theme selections, and plugin integrations.
*   `Gemfile` & `Dockerfile`: Ruby dependency declarations and containerization configurations for local development.

#### Templates and Operations
*   `_layouts/landing.html`: The layout shell for the standalone landing page. Contains inline CSS and standard HTML boilerplate.
*   `_posts/`: Directory containing all daily solutions.
*   `.github/workflows/pages.yml`: CI/CD pipeline configuring GitHub Actions to automated builds and deployments upon changes to the main branch.

## Adding a New Solution

Create a new Markdown file within the `_posts/` directory following the standardized naming convention:

`YYYY-MM-DD-problem-title-in-kebab-case.md`

Each file must include a YAML front matter block specifying the title, difficulty, and a brief excerpt:

```yaml
---
title: "Number. Problem Name"
difficulty: "Difficulty Level"
excerpt: "Brief summary of the core logic or insight."
---
```

## Local Development 

To run and test the site locally, utilize Docker:

```bash
docker compose up --build
```

The local instance will be accessible at `http://localhost:4000`.
