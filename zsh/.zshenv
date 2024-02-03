# nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# home brew
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
export PATH="/opt/homebrew/anaconda3/bin:$PATH"

# jvm
#export PATH=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home/bin:$PATH
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
export JAVA_HOME=/opt/homebrew/opt/openjdk
export PATH="$JAVA_HOME/bin:$PATH"

# cargo
. "$HOME/.cargo/env"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk/25.1.8937393"

# go
export PATH="/Users/golden_water/go/bin:$PATH"

# export PATH="/opt/homebrew/opt/curl/bin:$PATH"
# [ -s "/opt/homebrew/opt/curl/share/zsh/site-functions" ] && \. "/opt/homebrew/opt/curl/share/zsh/site-functions"

#export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"

export DISPLAY=:0
