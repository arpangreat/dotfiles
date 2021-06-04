#!/bin/sh

function help(){
  echo "usage: projectCreate -l lang "
  echo "optional : -g intialise a git repo inside project folder"
  echo "         : -h show this help message"
  echo "         : -p projectName -c className -e executableName"
}


git_init='false'

while getopts "l:hgp:c:e:" flag; do
    case "${flag}" in
        g)
            git_init='true'
            ;;
        l)
            lang="${OPTARG}"
            ;;
        p)
            project_name="${OPTARG}"
            ;;
        c)
            class_name="${OPTARG}"
            ;;
        e)
            exe_name="${OPTARG}"
            ;;
        h)
            help
            ;;
    esac
done

[[  -z $lang ]] && printf "Enter Language Name : " && read lang
[[  -z $project_name ]] && printf "Enter project Name : " && read project_name

function gradle_init(){


  [[  -z $class_name ]] && printf "Enter class Name : " && read class_name

  mkdir -p $project_name || exit
  mkdir -p $project_name/src/main/java
  mkdir -p $project_name/src/main/resources

  (
    echo "bin/*"
    echo ".project"
    echo ".gradle/*"
    echo ".settings/*"
    echo ".classpath"
    echo "build/*"
  ) > $project_name/.gitignore

  (
    echo -e "plugins{"
    echo -e "\tid 'java'"
    echo -e "}"
    echo -e "jar {"
    echo -e "\tmanifest {"
    echo -e "\t\tattributes 'Main-Class': '$class_name'"
    echo -e "\t}\n}\n"
  ) > $project_name/build.gradle

  folder="$(echo $project_name | sed "s/\./\//g" | xargs dirname)"
  class="$(echo $class_name | sed "s/\./\//g" | xargs basename)"
  mkdir -p $project_name/src/main/java/$folder
  touch $project_name/src/main/java/$folder/$class.java
  [ "$git_init" == "true" ] && git init $project_name
}

function cpp_init(){


  [[  -z $exe_name ]] && printf "Enter executable Name : " && read exe_name

  mkdir $project_name || exit

  mkdir $project_name/src
  mkdir $project_name/include
  mkdir $project_name/bin
  mkdir $project_name/debug
  touch $project_name/src/main.cc

  (
    echo "cmake_minimum_required(VERSION 2.8.9)"
    echo "project($project_name)"
    echo "include_directories(include)"
    echo 'file(GLOB_RECURSE SOURCES "src/*".cc)'
    echo "add_executable($exe_name \${SOURCES})"
    echo "install(TARGETS $exe_name DESTINATION /usr/bin)"
  ) > $project_name/CMakeLists.txt

  (
    echo "#!/bin/sh"
    echo 'if [[ -z $1 ]]; then'
    echo 'mkdir -p bin'
    echo 'cd bin'
    echo 'cmake ..'
    echo 'make'
    echo 'elif [[ "$1" == "install" ]]; then'
    echo 'mkdir -p bin'
    echo 'cd bin'
    echo 'cmake ..'
    echo 'sudo make install'
    echo 'elif [[ "$1" == "debug" ]]; then'
    echo 'mkdir -p debug'
    echo 'cd debug'
    echo 'cmake -DCMAKE_BUILD_TYPE=Debug ..'
    echo 'make'
    echo 'elif [[ "$1" == "project" ]]; then'
    echo 'mkdir -p bin'
    echo 'cd bin'
    echo 'cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..'
    echo 'cp compile_commands.json ..'
    echo 'fi'
    ) > $project_name/build

  chmod u+x $project_name/build

  (
    echo 'bin/*'
    echo 'debug/*'
    echo 'compile_commands.json'
    echo '.vimspector.json'
    echo '.clangd/*'
  ) > $project_name/.gitignore

  (
    echo '{'
    echo '"configurations": {'
    echo '"Launch": {'
    echo '"adapter": "vscode-cpptools",'
    echo '"configuration": {'
    echo '"request": "launch",'
    echo "\"program\": \"debug/$exe_name\","
    echo "\"cwd\": \"`pwd`\"," >> .vimspector.json
    echo '"externalConsole": true,'
    echo '"MIMode": "gdb"'
    echo '}'
    echo '}'
    echo '}'
    echo '}'
  ) > $project_name/.vimspector.json

  [ "$git_init" == "true" ] && git init $project_name

  cd $project_name && ./build project

}

function py_init(){

  mkdir $project_name || exit
  _project_name=$(echo $project_name | sed -e 's/-/_/g')
  mkdir -p $project_name/docs
  mkdir -p $project_name/$_project_name
  mkdir -p $project_name/tests
  touch $project_name/LICENSE
  touch $project_name/README.md
  touch $project_name/TODO.md
  touch $project_name/setup.py
  touch $project_name/.gitignore
  touch $project_name/install.sh
  touch $project_name/_project_name/__init__.py
  touch $project_name/$_project_name/utils.py
  touch $project_name/$_project_name/__main__.py
  [ "$git_init" == "true" ] && git init $project_name

}


case $lang in
  py )
    py_init
    ;;
  c|cpp )
    cpp_init
    ;;
  gradle )
    gradle_init
    ;;
esac
