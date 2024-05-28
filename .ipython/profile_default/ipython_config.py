c.InteractiveShellApp.exec_lines = ['%autoreload 2']

c.InteractiveShellApp.extensions.append("rich")
c.InteractiveShellApp.extensions.append("autoreload")
c.TerminalIPythonApp.display_banner = False

c.InteractiveShell.colors = 'Linux'

c.TerminalInteractiveShell.auto_match = True
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.highlighting_style = "monokai"

from IPython.terminal.prompts import Prompts, Token
class CustomPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '𝝿 '), (Token.Comment, ': ')]
    def out_prompt_tokens(self, cli=None):
        return []

c.TerminalInteractiveShell.prompts_class = CustomPrompt
c.TerminalInteractiveShell.true_color = True
