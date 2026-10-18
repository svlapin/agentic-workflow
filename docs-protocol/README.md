# Docs protocol

How agents keep a knowledge base in PARA form: Projects, Areas, Resources, Archive. It works with any agent that reads a rules file.

## Notes root

The notes root is the folder that holds the knowledge base.

1. Use the notes root that `~/AGENTS.local.md` defines.
2. If it defines none, use `~/docs`.

If the notes root has its own `AGENTS.md`, read it first. Its rules override this file.

## Structure

```
<notes root>/
  README.md                  # index: every project and area, one line each
  _templates/                # project.md, evergreen.md
  projects/<slug>/
    project.md               # goal, next steps, log
    <other files>            # optional: research, specs, drafts
  areas/<area>/<topic>.md  # evergreen docs for ongoing responsibilities
  resources/<topic>.md     # evergreen reference material
  archive/<slug>/          # finished or abandoned projects
```

Names are kebab-case. When a subject has no home, create the folder and add it to `README.md`.

## Where a note goes

- **Project**: work with a goal and an end. "Here is where we got to on X" goes here.
- **Area**: an ongoing responsibility with no end date. "This is how X works" goes here.
- **Resource**: reference material on a topic of interest, not tied to a responsibility.
- **Archive**: a project that is done or abandoned. Move the whole folder. Never delete it.

## Two kinds of document

**Project file** (`projects/<slug>/project.md`): the state of one piece of work. The "Next steps" section is rewritten on each update. The log is append-only, and every record has a timestamp. A fresh agent with no context must be able to continue the work from this file alone.

**Evergreen doc** (areas and resources): what is true about a subject. Present tense, edited in place. Correct it, sharpen it, and delete what is now false. No changelog sections and no dated prose. If a sentence only makes sense next to a date, it belongs in a project file.

## Working protocol

Before a non-trivial task:

1. Read `README.md` at the notes root.
2. Read the project file for the task, if one exists. Every project in `projects/` is live, and its file is a handoff to you.
3. Read the area and resource docs that the task touches.

Say which docs informed the work. If a doc contradicts the facts (code, data, a source), the facts win. Fix the doc as part of the task.

While you work, append a log record at each meaningful step: a decision, a discovery, a dead end, or a milestone. Do not save everything for the end. Context can be cleared without warning.

Before you finish, or when context is about to be cleared:

- **Always** update the project file: next steps, open questions, and key files.
- **If you learned something durable**, move it from the project log into the right area or resource doc, in timeless form. If nothing durable was learned, say so.

When a project is done:

1. Write a three-line outcome at the top of `project.md`.
2. Make sure every durable learning is in an area or resource doc.
3. Move the folder to `archive/` and update `README.md`.

## Templates

Templates keep every document in the same shape, so an agent that starts cold knows where to look.

- When you start a new project, copy `_templates/project.md` to `projects/<slug>/project.md` and fill it in.
- When you create an area or resource doc, start from `_templates/evergreen.md`.
- Keep the section names and their order. Leave a section empty if it does not apply. Do not delete it.
- If the notes root has its own `_templates/`, use those instead.

In Obsidian, point the core Templates plugin at `_templates/` to use the same files by hand.

## Timestamps

Never guess a timestamp. Run `date +"%Y-%m-%d %H:%M %Z"` and use the result.

- Every log record starts with `## YYYY-MM-DD HH:MM - <what happened>`.
- One project file per workstream, not per day.
- The frontmatter has `updated:`. Keep it correct.

## Setup

1. Copy `_templates/` into `<notes root>/_templates/`.
2. Add one line to your agent rules file: "Before you read or write notes, read and follow `<path to this file>`."
