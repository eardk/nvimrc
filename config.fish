if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting ""
fish_vi_key_bindings
set fish_color_valid_path
#fzf_configure_bindings
function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end
alias bat=batcat
alias vi=nvim
if test -f /Users/dk/.okta/fish_functions/okta-aws.fish 
    . /Users/dk/.okta/fish_functions/okta-aws.fish
end
if test -f /Users/dk/.okta/fish_functions/okta-sls.fish 
    . /Users/dk/.okta/fish_functions/okta-sls.fish
end
fish_add_path /Users/dk/.okta/bin/
set -gx DOTNET_ROOT /usr/local/share/dotnet/
alias dotnet-x64=/usr/local/share/dotnet/x64/dotnet
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" "/Users/dk/bin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
set -gx SHELL /opt/homebrew/bin/fish
set -gx AWS_CA_BUNDLE /Users/dk/.certs/Cloudflare_CA.pem
