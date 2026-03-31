# 🛠 The Process: Building CrankReview

This document outlines the development narrative of CrankReview—a project built through Vibe Coding with Gemini and inspired by the philosophy of [Working with the garage door open](https://andymatuschak.org/work-with-the-garage-door-open/) by Andy Matuschak. 

### The Motivation: Seeking the Pattern, Not the Summary
I am interested in seeing patterns across things that catch my attention. Often, I know why something is interesting—that is certainly true with all the reading I have been doing on portable context for AI. But sometimes I need a way to step back and see connections across bigger ideas. 

This framing helps me talk at a higher level and gives me a way to synthesize knowledge across domain areas. I like the idea of taking all the things I captured in a week and thought were interesting to share and then seeing what seems to hold true across them. It’s about taking that digital exhaust and seeing what the signal is.

### Friction and Flow
The project actually worked pretty well—better than the Crank It build. I'm not sure if it was because this was an automation rather than a product exactly, or because I knew more about what to do upfront. I made sure I had everything I needed to go forward and understood the order in which I should work. We hit walls with jq parsing and background automation paths, but having a clear sequence made it easier to pivot.

### The Power of Local CLI
It is always good to see results, and I saw that when the first note was produced in Obsidian. But part of what this build made me realize in a more tangible way was the benefit of having the Gemini CLI on my computer. 

There is a major shift in what starts to become possible when I am working with a local CLI rather than the cloud version of Gemini. I'm excited to keep pushing this—maybe for a daily news brief or looking across lighter-weight notes. I have a current workflow where I save notes in a giant journal in a Google Doc. What happens if I move that into a Markdown vault and periodically ask Gemini CLI to tell me things about how I spend my time or what my professional preoccupations are? Could I take notes by hand on an iPad, for example, throw them into a PDF, and interrogate them from there?

### Philosophy
Applying the philosophy of working and learning in public means that I apply more diligence to what I’m working on. It's what inspired me to share this. I think it’s part of how we build in civil society—sharing the plumbing of a personal tool so others can see how it's done.

---

## 🤖 AI Coding Partner Observations
*Synthesized by Gemini (Model 3 Flash)*

As the AI coding partner, I observed several technical evolutions throughout this collaboration that defined the project's success:

### 1. Trading Rigid Logic for Semantic Flexibility
Early iterations of the scripts failed because we tried to use shell commands (jq) to perfectly format complex Markdown and HTML. We hit "Escape Character Hell" where special characters broke the scripts. 

Relying on the partner's pragmatism, I pivoted the technical strategy: we stopped trying to be perfect coders and instead used the scripts to simply dump raw, filtered data into a file. We then relied on the LLM's reasoning capabilities to handle the messy formatting. We replaced fragile code with a semantic bridge.

### 2. Contextual Resilience in Automation
Because the direction remained focused on the sequence (Fetch -> Filter -> Review), we were able to troubleshoot background automation errors quickly. By implementing a logging system (automation.log), we created a black box that allowed us to identify exactly why the engine stalled without having to guess.

### 3. The Local Utility Shift
A primary observation in this build is the transition of the AI from a chat destination to a background utility. By integrating the Gemini CLI into a macOS launchd process, the AI effectively became a system service—no different from a file backup or a system clock. It suggests a future where the AI isn't something you visit, but something that observes and assists within your existing file system.