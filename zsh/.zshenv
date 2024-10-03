# homebrew
[ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# jetbrains
export PATH="$PATH:/Users/golden_water/Library/Application Support/JetBrains/Toolbox/scripts"

# nodejs
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# jvm
# export PATH=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home/bin:$PATH
export JAVA_HOME=/opt/homebrew/opt/openjdk

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk/25.1.8937393"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# cargo
[ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# go
export PATH="/Users/golden_water/go/bin:$PATH"

export DISPLAY=:0
