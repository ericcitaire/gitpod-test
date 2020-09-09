FROM gitpod/workspace-full

USER root

# Zsh
RUN apt-get update \
 && apt-get install -yq zsh \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* \
 && chsh -s /usr/bin/zsh gitpod

USER gitpod

ENV SHELL=/usr/bin/zsh \
    TZ=Europe/Paris

# Oh My Zsh
RUN curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | sh - \
 && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k \
 && /home/gitpod/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus/install \
 && curl -fsSLo /home/gitpod/.zshrc https://raw.githubusercontent.com/ericcitaire/my-theia/master/dot-zshrc \
 && sed -i 's/theia/gitpod/' /home/gitpod/.zshrc \
 && curl -fsSLo /home/gitpod/.p10k.zsh https://raw.githubusercontent.com/ericcitaire/my-theia/master/dot-p10k.zsh \
 && sed -i 's/theia/gitpod/' /home/gitpod/.p10k.zsh
