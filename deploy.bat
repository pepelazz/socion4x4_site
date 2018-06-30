echo -e "Deploying updates to GitHub..."
@echo off
REM Build the project.
REM if using a theme, replace by `hugo -t <yourtheme>`
@echo on
hugo
@echo off
REM Go To Public folder
@echo on
cd public
@echo off
REM Add changes to git.
@echo on
git add .
@echo off
REM Commit changes.
@echo on
@echo off
if %1.==. (
  for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
  set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
  set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
  set "fullstamp=%YYYY%-%MM%-%DD%-%HH%-%Min%-%Sec%"
  set msg="rebuilding site "+"%fullstamp%"
) else (
  set msg=%1
)
@echo on
git commit -m %msg%
@echo off
REM Push source and build repos.
@echo on
git push origin master
@echo off
REM Come Back
@echo on
cd ..

REM сохраняем исходники
@echo on
git add .
@echo off

@echo on
git commit -m %msg%
@echo off

@echo on
git push origin master
@echo off