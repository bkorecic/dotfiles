source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_check_for_new_release.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
    _mock _pure_set_color
end

before_each
@test "_pure_check_for_new_release: is disabled" (
    set --universal pure_check_for_new_release false

    _pure_check_for_new_release
) $status -eq $SUCCESS

before_each
@test "_pure_check_for_new_release: nothing when same as latest" (
    set --universal pure_check_for_new_release true
    set --universal pure_version 0.0.1
    function curl; echo '"tag_name": "v0.0.1",'; end # mock

    _pure_check_for_new_release
) = '🛈 Checking for new release…'

before_each
@test "_pure_check_for_new_release: show fisher command to install when enable" (
    set --universal pure_check_for_new_release true
    set --universal pure_version 0.0.1
    function curl; echo '"tag_name": "v9.9.9",'; end # mock

    set output (_pure_check_for_new_release 2>&1)
    echo $output[2] $output[4]
) = '🔔 New version available! fisher install pure-fish/pure@v9.9.9'

before_each
@test "_pure_check_for_new_release: extract release version from JSON" (
    function curl; echo '"tag_name": "v9.9.9",'; end # mock

    pure_get_latest_release_version "pure-fish/pure"
) = 'v9.9.9'
