# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

c.qt.args += ['--disable-gpu', '--disable-features=InstalledApp']
c.tabs.title.format = "{audio}{index}"
c.fonts.web.size.default = 16


c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
}

config.load_autoconfig() # load settings done via the gui

c.scrolling.bar = "always"
c.auto_save.session = True # save tabs on quit/restart

# keybinding changes
config.bind('za', 'open -t http://localhost:4321/')
config.bind('zr', 'open -t http://locahost:5173/')
config.bind('zgh', 'open -t github.com/fabirez')

config.bind('h', 'history')
# config.bind('cc', 'hint images spawn sh -c "cliphist link {hint-url}"')
config.bind('cs', 'config-source')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')

config.bind('<Ctrl+1>', 'tab-focus 1')
config.bind('<Ctrl+2>', 'tab-focus 2')
config.bind('<Ctrl+3>', 'tab-focus 3')
config.bind('<Ctrl+4>', 'tab-focus 4')
config.bind('<Ctrl+5>', 'tab-focus 5')
config.bind('<Ctrl+6>', 'tab-focus 6')
config.bind('<Ctrl+7>', 'tab-focus 7')
config.bind('<Ctrl+8>', 'tab-focus 8')
config.bind('<Ctrl+9>', 'tab-focus 9')
config.bind('<Ctrl+0>', 'tab-focus 10')

# styles, cosmetics
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
c.tabs.width = '1%'
c.tabs.max_width = 60
c.statusbar.show = 'always'

# fonts
c.fonts.default_size = '11pt'

# privacy 
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle
