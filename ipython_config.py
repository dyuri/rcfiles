from IPython.terminal.prompts import Prompts, Token

c = get_config()


c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.true_color = True
c.TerminalInteractiveShell.colors = "gruvbox-dark"

c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.Prompt: "bg:#cddc39 #080",
    Token.PromptNum: "bg:#cddc39 #000",
    Token.PromptEnd: "#cddc39",
    Token.OutPrompt: "bg:#333 #f40",
    Token.OutPromptNum: "bg:#333 #cddc39",
    Token.OutPromptEnd: "#333",
    Token.PromptCont: "#cddc39"
}


class RepaPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [
            (Token.Prompt, "   "),
            (Token.PromptNum, str(self.shell.execution_count) + " "),
            (Token.PromptEnd, " "),
        ]

    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()
        return [
            (Token.PromptCont, ('•' * (width - 2)) + u' '),
        ]

    def out_prompt_tokens(self, cli=None):
        return [
            (Token.OutPrompt, "   "),
            (Token.OutPromptNum, str(self.shell.execution_count) + " "),
            (Token.OutPromptEnd, " "),
        ]


c.TerminalInteractiveShell.prompts_class = RepaPrompt

# from powerline.bindings.ipython.since_7 import PowerlinePrompts
# c.TerminalInteractiveShell.prompts_class = PowerlinePrompts
