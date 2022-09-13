
# ask for a new project's name that you wish to rename to
read newProjectName

# get the current directory name
# assuming that the current directory name is the current project name
currentProjectName="$(basename $(pwd))"

#LC_ALL=C find . -type f -exec sed -i '' "s/$currentProjectName/$newProjectName/g" {} +


ruby <<-EORUBY
Dir.glob("**/*").select { |file_path| File.basename(file_path).include?($currentProjectName) }.reverse().each { |file|
    File.rename(file, file.sub(/.*\KINGProjectTemplate/, "$projectName"))
}
EORUBY

echo "#$newProjectName" > README.md

