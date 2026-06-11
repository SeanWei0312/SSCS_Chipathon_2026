# Registering for IEEE SSCS 2026 Chipathon

A step-by-step guide to ensure that your team and all members are registered for the 2026 chipathon.

1. Join the 2026 SSCS "PICO" Open-Source Chipathon discord server. https://discord.gg/bAQFg6UAsU <br>The #chipathon-announcements channel will have important information. Check it daily.
   
3. Edit Per-server Profile and set Server Nickname. Use only English letters.
<img width="320" height="616" alt="スクリーンショット 2026-06-11 0 19 49" src="https://github.com/user-attachments/assets/f705f0f2-3297-4ea5-9004-03a32358d498" />


<img width="697" height="378" alt="スクリーンショット 2026-06-11 0 22 44" src="https://github.com/user-attachments/assets/202d6b23-2f75-4e1f-a7a4-07eb12928f31" />


3. Complete the one time registration using [this google form](https://forms.gle/oX4Bes1dQkHNz4N27).
4. Fork the repo for project development.
   - The team lead should login to github.com
   - Goto https://github.com/Mauricio-xx/chipathon-2026-gf180mcu-padring and create a fork.
     <img width="1294" height="235" alt="スクリーンショット 2026-06-11 10 44 04" src="https://github.com/user-attachments/assets/c0c51fa7-8907-46a4-9634-e5c0b16064d1" />
     <img width="1150" height="615" alt="スクリーンショット 2026-06-11 10 44 28" src="https://github.com/user-attachments/assets/18633531-0a79-4b56-b84a-fc415267136c" />
   - Team members should fork the team lead's repo.
5. Setup your local development repo. <br>Copy your forked repo's url as in this screen shot.
   <img width="1346" height="427" alt="スクリーンショット 2026-06-11 10 48 42" src="https://github.com/user-attachments/assets/b7234eac-e906-4154-abad-4d6e77c85034" />
   ```
   git clone <your-project-url>
   cd <your-project-directory>
   git remote add upstream <url-of-the-base-repo-you-forked>
   git remote -v
   ```
This should display something like this, with the upstream remote pointing to the base of your fork.
```
% git remote -v
origin	https://github.com/d-m-bailey/chipathon2026-project.git (fetch)
origin	https://github.com/d-m-bailey/chipathon2026-project.git (push)
upstream	https://github.com/Mauricio-xx/chipathon-2026-gf180mcu-padring.git (fetch)
upstream	https://github.com/Mauricio-xx/chipathon-2026-gf180mcu-padring.git (push)
```
