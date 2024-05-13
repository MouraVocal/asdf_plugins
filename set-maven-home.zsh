asdf_update_maven_home() {
    local maven_path
    maven_path="$(asdf which mvn)"
    if [[ -n "${maven_path}" ]]; then
        export MAVEN_HOME
        export M2_HOME
        MAVEN_HOME="$(dirname "$(dirname "${maven_path:A}")")"
        export M2_HOME=${MAVEN_HOME}
    fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_maven_home

# put this file on the path ~/.asdf/plugins/maven
# add the following code to ~/.zshrc file and remove the comment symbol hashtag "#"
# . ~/.asdf/plugins/maven/set-maven-home.zsh
